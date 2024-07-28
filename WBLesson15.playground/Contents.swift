import Foundation

struct Task {
    let id: Int
    let data: String
}

struct TaskResult {
    let taskId: Int
    let result: String
}

final class Coordinator {
    private var tasks: [Task]
    private var results: [TaskResult] = []
    private let taskQueue = DispatchQueue(label: "taskQueue", attributes: .concurrent)
    private let resultQueue = DispatchQueue(label: "resultQueue", attributes: .concurrent)
    private let semaphore = DispatchSemaphore(value: 1)
    
    init(tasks: [Task]) {
        self.tasks = tasks
    }
    
    func getTask() -> Task? {
        var task: Task?
        semaphore.wait()
        if !tasks.isEmpty {
            task = tasks.removeFirst()
        }
        semaphore.signal()
        return task
    }
    
    func submitResult(_ result: TaskResult) {
        resultQueue.async(flags: .barrier) {
            self.results.append(result)
            print("Result received: \(result)")
        }
    }
    
    func getResults() -> [TaskResult] {
        var currentResults: [TaskResult] = []
        resultQueue.sync {
            currentResults = self.results
        }
        return currentResults
    }
}

final class Client {
    private let id: Int
    private let coordinator: Coordinator
    private let processingQueue = DispatchQueue(label: "processingQueue")
    
    init(id: Int, coordinator: Coordinator) {
        self.id = id
        self.coordinator = coordinator
    }
    
    func start() {
        processingQueue.async {
            while let task = self.coordinator.getTask() {
                print("Client \(self.id) processing task \(task.id)")
                self.processTask(task)
            }
            print("Client \(self.id) has no more tasks to process.")
        }
    }
    
    private func processTask(_ task: Task) {
        var attempt = 0
        let maxAttempts = 3
        
        while attempt < maxAttempts {
            do {
                let result = try self.process(task)
                self.coordinator.submitResult(result)
                return
            } catch {
                attempt += 1
                print("Error processing task \(task.id) by client \(self.id): \(error). Attempt \(attempt) of \(maxAttempts).")
            }
        }
        
        print("Client \(self.id) failed to process task \(task.id) after \(maxAttempts) attempts.")
    }
    
    private func process(_ task: Task) throws -> TaskResult {
        // Симуляция обработки задачи
        let processedData = "Processed \(task.data) by client \(self.id)"
        sleep(2)  // Симулируем время обработки
        
        // Симуляция возможной ошибки
        if arc4random_uniform(10) < 3 { // 30% шанс на ошибку
            throw NSError(domain: "ClientErrorDomain", code: 1, userInfo: [NSLocalizedDescriptionKey: "Processing error for task id \(task.id)"])
        }
        
        return TaskResult(taskId: task.id, result: processedData)
    }
}

// Создаем задачи
let tasks: [Task] = (0..<10).map { Task(id: $0, data: "TaskData-\($0)") }
print(tasks)
print(tasks.count)
print("--------------------------------------Start--------------------------------------")
// Создаем координатора
let coordinator = Coordinator(tasks: tasks)

// Создаем и запускаем клиентов
let clients = (0..<3).map { Client(id: $0, coordinator: coordinator) }
clients.forEach { $0.start() }

DispatchQueue.global().asyncAfter(deadline: .now() + 25) {
    // Проверка всех результатов через некоторое время
    let results = coordinator.getResults()
    print("--------------------------------------FINISH--------------------------------------")
    print("All results: \(results)")
    print(results.count)
}

RunLoop.main.run(until: Date().addingTimeInterval(30))
