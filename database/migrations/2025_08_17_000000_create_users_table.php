<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    public function up(): void
    {
        Schema::create('users', function (Blueprint $table) {
            $table->id('id_user');
            $table->string('name', 100)->nullable();
            $table->string('email', 100)->nullable();
            $table->string('password', 255)->nullable();
            $table->string('number_phone', 20)->nullable();
            $table->boolean('is_verified')->default(0);
            $table->enum('role', ['admin', 'client', 'model'])->nullable();
            $table->string('remember_token', 100)->nullable();
            $table->datetime('last_active')->nullable();
            $table->timestamps();
        });
    }

    public function down(): void
    {
        Schema::dropIfExists('users');
    }
};
