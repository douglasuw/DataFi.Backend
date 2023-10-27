import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';


import { JwtService } from '@nestjs/jwt';


import { HealthModule } from './health/health.module';
import { UserModule } from './user/user.module';



@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),

    HealthModule,

    UserModule,
  ],
  controllers: [],
  providers: [JwtService],
})
export class AppModule { }
