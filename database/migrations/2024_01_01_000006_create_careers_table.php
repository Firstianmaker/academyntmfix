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
        Schema::create('careers', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_model');
            $table->string('photo', 255)->nullable();
            $table->string('event_name', 255)->nullable();
            $table->string('year', 10)->nullable();
            
            $table->foreign('id_model')->references('id_model')->on('models')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('careers');
    }
};
