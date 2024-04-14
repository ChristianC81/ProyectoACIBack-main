package com.sistema.examenes;

import com.google.auth.oauth2.GoogleCredentials;
import com.google.firebase.FirebaseApp;
import com.google.firebase.FirebaseOptions;
import com.sistema.examenes.services.Archivoservices;
import org.springframework.boot.CommandLineRunner;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

import javax.annotation.Resource;
import java.io.FileInputStream;

@EnableScheduling
@SpringBootApplication
public class SistemaExamenesBackendApplication implements CommandLineRunner {
	
@Resource
	Archivoservices servis;
	public static void main(String[] args) {

		// Inicializar Firebase aquí
		try {
			FileInputStream serviceAccount = new FileInputStream("src/main/java/acid-c2eea-firebase-adminsdk-ssa9x-3f8d47f30e.json");

			FirebaseOptions options = new FirebaseOptions.Builder()
					.setCredentials(GoogleCredentials.fromStream(serviceAccount))
					.build();

			FirebaseApp.initializeApp(options);
		} catch (Exception e) {
			e.printStackTrace();
		}
		SpringApplication.run(SistemaExamenesBackendApplication.class, args);
		double maxHeapSize = Runtime.getRuntime().maxMemory();
		String sizeInReadableForm;

		double kbSize = maxHeapSize / 1024;
		double mbSize = kbSize / 1024;
		double gbSize = mbSize / 1024;

		if (gbSize > 0) {
			sizeInReadableForm = gbSize + " GB";
		} else if (mbSize > 0) {
			sizeInReadableForm = mbSize + " MB";
		} else {
			sizeInReadableForm = kbSize + " KB";
		}

		System.out.println("Maximum Heap Size: " + sizeInReadableForm);
	}

	@Override
	public void run(String... args) throws Exception {
		servis.init();
		System.out.println("Se realiza la creacion del directorio para archivos");
	}



}
