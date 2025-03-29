allprojects {
    repositories {
        google()
        mavenCentral()
    }
}



val newBuildDir: Directory = rootProject.layout.buildDirectory.dir("../../build").get()
rootProject.layout.buildDirectory.value(newBuildDir)

subprojects {
    val newSubprojectBuildDir: Directory = newBuildDir.dir(project.name)
    project.layout.buildDirectory.value(newSubprojectBuildDir)

    // // Add this block to force SDK 35 for all subprojects including share_plus
    // plugins.withId("com.android.library") {
    //     extensions.findByType<com.android.build.gradle.LibraryExtension>()?.apply {
    //         compileSdk = 35
    //     }
    // }
}
subprojects {
    project.evaluationDependsOn(":app")    
}

tasks.register<Delete>("clean") {
    delete(rootProject.layout.buildDirectory)
}


