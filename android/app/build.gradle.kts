plugins {
    id("com.android.application")
    id("kotlin-android")
    // Le plugin Flutter doit être appliqué après Android et Kotlin.
    id("dev.flutter.flutter-gradle-plugin")
}

android {
    // 1. Ton namespace (utilisé en interne par Android Studio)
    namespace = "com.statisfuel.app"
    compileSdk = flutter.compileSdkVersion
    ndkVersion = flutter.ndkVersion

    compileOptions {
        sourceCompatibility = JavaVersion.VERSION_11
        targetCompatibility = JavaVersion.VERSION_11
    }

    kotlinOptions {
        jvmTarget = JavaVersion.VERSION_11.toString()
    }

    defaultConfig {
        // 2. Ton identifiant unique d'application (à renseigner dans la console Firebase)
        applicationId = "com.statisfuel.app"
        
        minSdk = flutter.minSdkVersion
        targetSdk = flutter.targetSdkVersion
        versionCode = flutter.versionCode
        versionName = flutter.versionName
    }

    buildTypes {
        release {
            // Pour tester sur Firebase, utiliser la clé debug suffit dans un premier temps.
            // Quand tu iras sur le Play Store, il faudra configurer une vraie clé de signature.
            signingConfig = signingConfigs.getByName("debug")
        }
    }
}

flutter {
    source = "../.."
}