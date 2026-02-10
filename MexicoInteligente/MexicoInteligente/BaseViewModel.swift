//
//  BaseViewModel.swift
//  MexicoInteligente
//
//  Created by Jorge Espinoza on 23/01/26.
//

import Foundation
import Combine
import SwiftUI
import UIKit
import Network

class BaseViewModel: ObservableObject {
    
    private let monitor = NWPathMonitor()
    private let queue = DispatchQueue(label: "NetworkMonitor")
    @Published var isConnected: Bool = false
    @Published var isLoading: Bool = false
    @Published var alertMessage: String = ""
    @Published var isShowingAlert: Bool = false
    @Published var disableBtn: Bool = true
    @Published var accessTokenValid = false
    @Published var isSuccessSignOut: Bool = false
    @Published var idServer = 0
    @Published var titles = ""
    @Published var descriptin = ""
    @Published var date = ""
    @Published var pendingSave = false
    @Published var status = 0
    @Published var prePhoneRegister = ""
    
    @Published var onBoardingList = [
        OnboardingItem(index: 0, title: "Agiliza y asegura el cierre de tus rentas", description: "Accede a productos que se adecuen a los requerimientos de tus operaciones", imageName: "cell"),
        OnboardingItem(index: 1, title: "Centraliza y optimiza tus operaciones", description: "Visibiliza el proceso de tus operaciones y aumenta tus ingresos", imageName: "cell"),
        OnboardingItem(index: 2, title: "Lleva tu carrera inmobiliaria al siguiente nivel", description: "Encuentra materiales exclusivos y cierra la renta perfecta", imageName: "cell")
    ]
    
    @Published var operationsList = [
        OperationsItem(index: 0, step: 1, operationsId: "95898", contract: "", address: "Mexico 89", tenant: "Jorge Espinoza", landlord: "", dateRenovation: "", operationalStatus: .Registrada, status: .Pendiente, typeOpe: .Activa),
        OperationsItem(index: 1, step: 5, operationsId: "84786", contract: "", address: "Ave Palo alto 11901 B", tenant: "Isra Romero", landlord: "", dateRenovation: "", operationalStatus: .Habitacional, status: .Disponible, typeOpe: .Activa),
        OperationsItem(index: 2, step: 3, operationsId: "85686", contract: "A46753", address: "Ave Palo solo 130B F603", tenant: "Jacqueline Wood Gayou", landlord: "Jorge Arturo Lopez Perez", dateRenovation: "01 diciembre 2026", operationalStatus: .Vigente, status: .Disponible, typeOpe: .Cerrada),
        OperationsItem(index: 3, step: 7, operationsId: "95284", contract: "A46753", address: "Ave Palo solo 130B F603", tenant: "Jacqueline Wood Gayou", landlord: "Jorge Arturo Lopez Perez", dateRenovation: "01 diciembre 2026", operationalStatus: .LocalComercial, status: .Disponible, typeOpe: .Activa)
    ]
    
    @Published var actionsHomeList = [
        ActionsHomeItem(index: 0, title: "Expediente inmobiliario", imageName: "expediente"),
        ActionsHomeItem(index: 1, title: "Investigacion", imageName: "investigacion"),
        ActionsHomeItem(index: 2, title: "Venta de polizas", imageName: "ventaPoliza")
    ]
    
    @Published var stepsList = [
        StepsItem(category: "Perfiles e investigación", steps: [
            Steps(icon: "inquilino", title: "Perfil de inquilino", status: .Pendiente, description: "Falta crear el perfil desde portal de inquilino"),
            Steps(icon: "search", title: "Investigación", status: .NoDisponible, description: "Se necesitan perfiles completos y pago de investigación")
        ]),
        StepsItem(category: "Contratos", steps: [
            Steps(icon: "propietario", title: "Información de propietario", status: .Pendiente, description: "Falta subir la información de propietario"),
            Steps(icon: "ventaPoliza", title: "Contratos", status: .NoDisponible, description: "Estará disponible más adelante")
        ]),
        StepsItem(category: "Pagos y firma", steps: [
            Steps(icon: "money", title: "Pagos", status: .Pendiente, description: "Pendiente"),
            Steps(icon: "home", title: "Firma", status: .NoDisponible, description: "Podrás agendar la firma más adelante en el proceso"),
            Steps(icon: "home", title: "Detalle de producto", status: .Completo, description: "El producto ha sido confirmado")
        ]),
    ]
    
    @Published var teamList = [
        TeamItem(index: 0, name: "Rossy Ramirez", cel: "2223668910", email: "rramirez@gmail.com", isAsesor: false, date: "26 enero 2026"),
        TeamItem(index: 1, name: "Lourdes Puebla", cel: "2221624927", email: "lpuebla@gmail.com", isAsesor: false, date: "22 dic 2025"),
        TeamItem(index: 2, name: "Karla Carpinteyro", cel: "2222777105", email: "karla@gmail.com", isAsesor: true, date: "16 julio 2025"),
    ]
    
    /*func saveUser(request: UserRequest, root: BackView) {
        
        self.isLoading = true
        
        let url = ConfigRequest.getUrlWs(endPoint: EndPoints.Register.WS_PHP_SAVE_USER)
        
        guard let jsonData = try? JSONEncoder().encode(request) else {
            print("Error: Trying to convert model to JSON data")
            return
        }
        
        let jsonString = String(data: jsonData, encoding: .utf8)
        debugPrint("Request: \(String(describing: jsonString))")
        
        let request = ConfigRequest.getConfiguration(url: url, type: .post, data: jsonData)
        ConfigRequest.fetchData(request: request) { (result) in
            
            DispatchQueue.main.async {
                self.isLoading = false
                
                switch result {
                    
                case .success(let response):
                    do {
                        let decoder = JSONDecoder()
                        
                        let dataResponse = try decoder.decode(UserResponse.self, from: response)
                        
                        if dataResponse.Status {
                            UserDefaultsPref.userId = dataResponse.userId ?? 0
                            UserDefaultsPref.userName = dataResponse.name ?? "Sin nombre"
                            UserDefaultsPref.userEmail = dataResponse.email ?? "Sin email"
                            UserDefaultsPref.userPhoto = dataResponse.photo ?? ""
                            UserDefaultsPref.lastLogin = Date.getDateFormat(date: Date())
                            
                            print("Llendo a home")
                            root.path.append(Routes.Home)//Quitar
                        } else {
                            self.clearUserDefaults()
                        }
                    } catch {
                        
                    }
                    
                case .failure(let failure):
                    if failure == NetworkError.error403 {
                        self.alertMessage = "\(failure.errorDescription ?? "")"
                        self.isShowingAlert = true
                        print("56: \(self.alertMessage)")
                    } else if failure == NetworkError.badRequest { // Revisar si corresponde al 409
                        self.alertMessage = "\(failure.errorDescription ?? "")"
                        self.isShowingAlert = true
                        print("58: \(self.alertMessage)")
                    } else {
                        self.alertMessage = "\(failure.errorDescription ?? "")"
                        self.isShowingAlert = true
                        print("60: \(self.alertMessage) - self.isShowingAlert:: \(self.isShowingAlert)")
                    }
                    
                case nil:
                    print("Fue nil")
                }//End Switch
            }
            
        }//End fetchData
        
    }//End saveUser*/
    
    func signOut(root: Navigation) {
        self.clearUserDefaults()
        root.path.append(Routes.PhoneNumber)
    }
    
    func clearUserDefaults() {
        UserDefaultsPref.userName = ""
        UserDefaultsPref.userPhoto = ""
        UserDefaultsPref.userPhone = ""
        UserDefaultsPref.userId = 0
        UserDefaultsPref.userEmail = ""
        UserDefaultsPref.hideCreateRealState = false
        UserDefaultsPref.hideOnboarding = false
    }
    
    //*********************************Monitoring Internet*******************//
    func startMonitoring() {
        monitor.pathUpdateHandler = { path in
            DispatchQueue.main.async {
                self.isConnected = path.status == .satisfied
                print("Internet connection: \(self.isConnected)") // For debugging
            }
        }
        monitor.start(queue: queue)
    }
    
    func stopMonitoring() {
        monitor.cancel()
    }
}
