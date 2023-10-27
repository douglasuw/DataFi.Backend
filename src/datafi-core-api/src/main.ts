import { ValidationPipe } from '@nestjs/common';
import { ConfigService } from '@nestjs/config';

import { NestFactory } from '@nestjs/core';
import { DocumentBuilder, SwaggerModule } from '@nestjs/swagger';
import { AppModule } from './app.module';
import CorsAllowedOrigins from './config/configuration';


async function bootstrap() {
  const app = await NestFactory.create(AppModule, {
    logger: ['error', 'warn', 'log'],
  });

  const configService = app.get(ConfigService);
  const corsAllowedOrigins = CorsAllowedOrigins();

  app.enableCors({
    origin: corsAllowedOrigins.CORS,
    methods: 'GET, POST',
    credentials: true,
    allowedHeaders: '*',
  });

  app.useGlobalPipes(new ValidationPipe(
    {
      whitelist: true,
      forbidNonWhitelisted: true,
      errorHttpStatusCode: 422,
    }
  ));

  const swaggerPath = configService.getOrThrow('SWAGGER_PATH');

  const config = new DocumentBuilder()
    .setTitle('Datafi Core API')
    .setDescription(" This API will request facebook and Google data and Control User Roles and Access")
    .setVersion('1.0')
    .addServer(swaggerPath)
    .addBearerAuth(
      {
        type: 'http',
        scheme: 'bearer',
        bearerFormat: 'JWT',
        name: 'JWT',
        description: 'Enter JWT token',
        in: 'header',
      },
      'JWT-auth',
    )
    .build();

  const document = SwaggerModule.createDocument(app, config);

  SwaggerModule.setup('api', app, document, {
    swaggerOptions: {
      persistAuthorization: true,
      swaggerOptions: { defaultModelsExpandDepth: 0, }
    },
  });

  await app.listen(configService.get('PORT'));

}

bootstrap();
