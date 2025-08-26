<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     */
    public function up(): void
    {
        Schema::create('models', function (Blueprint $table) {
            $table->id('id_model');
            $table->string('nama_model', 100)->nullable();
            $table->string('city', 100)->nullable();
            $table->integer('age')->nullable();
            $table->integer('height')->nullable();
            $table->integer('weight')->nullable();
            $table->integer('shoes_size')->nullable();
            $table->integer('bust')->nullable();
            $table->integer('waist')->nullable();
            $table->string('size', 50)->nullable();
            $table->enum('categories', ['kids', 'teens'])->nullable();
            $table->enum('status', ['available', 'unavailable'])->nullable();
            $table->string('photo', 255)->nullable();
            $table->integer('experience_value')->nullable();
            $table->string('experience_unit', 10)->nullable();
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('models');
    }
};
