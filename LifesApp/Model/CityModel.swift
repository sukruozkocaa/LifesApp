//
//  CityModel.swift
//  LifesApp
//
//  Created by Şükrü Özkoca on 7.03.2023.
//

import Foundation

struct City {
    let cityName: String
    
    init(cityName: String) {
        self.cityName = cityName
    }
}

extension City {
    static var data: [City] {
        return [
            City(cityName: "ADANA"),City(cityName: "ADIYAMAN"),City(cityName: "AĞRI"),City(cityName: "AMASYA"),City(cityName: "ANKARA"),City(cityName: "ANTALYA"),City(cityName: "ARTVİN"),City(cityName: "AYDIN"),City(cityName: "BALIKESİR"),City(cityName: "BİLECİK"),City(cityName: "BİNGÖL"),City(cityName: "BİTLİS"),City(cityName: "BOLU"),City(cityName: "BURDUR"),City(cityName: "BURSA"),City(cityName: "ÇANAKKALE"),City(cityName: "ÇANKIRI"),City(cityName: "ÇORUM"),City(cityName: "DENİZLİ"),City(cityName: "DİYARBAKIR"),City(cityName: "EDİRNE"),City(cityName: "ELAZIĞ"),City(cityName: "ERZİNCAN"),City(cityName: "ERZURUM"),City(cityName: "ESKİŞEHİR"),City(cityName: "GAZİANTEP"),City(cityName: "GİRESUN"),City(cityName: "GÜMÜŞHANE"),City(cityName: "HAKKARİ"),City(cityName: "HATAY"),City(cityName: "ISPARTA"),City(cityName: "MERSİN"),City(cityName: "İSTANBUL"),City(cityName: "İZMİR"),City(cityName: "KARS"),City(cityName: "KASTAMONU"),City(cityName: "KAYSERİ"),City(cityName: "KIRKLARELİ"),City(cityName: "KIRŞEHİR"),City(cityName: "KOCAELİ"),City(cityName: "KONYA"),City(cityName: "KÜTAHYA"),City(cityName: "MALATYA"),City(cityName: "MANİSA"),City(cityName: "KAHRAMANMARAŞ"),City(cityName: "MARDİN"),City(cityName: "MUĞLA"),City(cityName: "MUŞ"),City(cityName: "NEVŞEHİR"),City(cityName: "NİĞDE"),City(cityName: "ORDU"),City(cityName: "RİZE"),City(cityName: "SAKARYA"),City(cityName: "SAMSUN"),City(cityName: "SİİRT"),City(cityName: "SİNOP"),City(cityName: "SİVAS"),City(cityName: "TEKİRDAĞ"),City(cityName: "TOKAT"),City(cityName: "TRABZON"),City(cityName: "TUNCELİ"),City(cityName: "ŞANLIURFA"),City(cityName: "UŞAK"),City(cityName: "VAN"),City(cityName: "YOZGAT"),City(cityName: "ZONGULDAK"),City(cityName: "AKSARAY"),City(cityName: "BAYBURT"),City(cityName: "KARAMAN"),City(cityName: "KIRIKKALE"),City(cityName: "BATMAN"),City(cityName: "ŞIRNAK"),City(cityName: "BARTIN"),City(cityName: "ARDAHAN"),City(cityName: "IĞDIR"),City(cityName: "YALOVA"),City(cityName: "KARABÜK"),City(cityName: "KİLİS"),City(cityName: "OSMANİYE"),City(cityName: "DÜZCE")
        ]
    }
}
