# fake_store_app

A new Flutter project.

## Descripción
Esta es una aplicación Flutter destinada al consumo de la api fake store  y a la demostración de manejo de errores
.

## Estructura del Proyecto
La aplicación sigue una arquitectura limpia, utilizando  `Riverpod` para manejar el estado y la lógica de negocio. El proyecto está dividido en las siguientes capas mediante segregación de carpetas:
- **domain**: Contiene los entities con sus respectivos modelos y su repository,los usecases con su referencia al repository.
- **infraestructure**: Contiene nuestros driven adapters que en este caso implementan la api (fakeStore), con su respectiva carpeta de helpers y de errors, accediendo solo a la capa de dominio mediante el repository.
- **presentation**: Contiene las vistas o pantallas de la aplicación (FormScreen, HomeScreen,DetailsScreen) y una carpeta common para manejar widgets comunes en ausencia de un sistema de diseño y solo accede a la capa de dominio.
- **config**: Contiene los providers de Riverpod para manejar el estado de la aplicación y los notifier.

## Funcionalidades Principales
- Visualizar en cards información relacionada a los productos de la api.
- Visualizar las categorias existentes.
-visualizar el carrito de compras.


## Consideraciones
- la aplicación usa Either para el manejo de datos (right) y errores(left).
- la aplicación contiene un api error handler que controla las respuestas de la api
  los errores los maneja en una función handle que identifica el error y responde con un mensaje acorde al error
  y la data obtenida la retorna correctamente 
- los modelos de la aplicación son diseñados a partir de los campos esperados por cada endpoint y manejan la inmutabilidad
  es decir que sus propiedades son de tipo final, el constructor es una constante, no permite funciones de tipo
  copyWith y aparte tiene la etiqueta de inmutable, se uso json serialization también
- para el consumo de la APi se establecio el tipo de retorno de tipo either y el objeto que se desee (product,categories,cart)
- en los notifier se uso la recreación manual de los posibles estados de consumo con su respectiva jerarquia ,
- se usaron providers necesarios para mantener la logica lo mas modular posible, providers de usecases, de repositorys,
  de y de notifiers que son los que se usan en la vista con ref , un notifier por caso en especifico
- la aplicación usa la librería 'Logger' para hacer logs mas destacados en la consola y evitar el uso de prints.
- la aplicación en el itemNotifier crea dos cards por defecto al iniciar la aplicación como una muestra o ejemplo.
