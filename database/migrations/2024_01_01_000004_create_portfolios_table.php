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
        Schema::create('portfolios', function (Blueprint $table) {
            $table->id('id_portfolios');
            $table->unsignedBigInteger('id_model')->nullable();
            $table->string('nama_model', 100)->nullable();
            $table->string('photo', 255)->nullable();
            $table->text('description')->nullable();
            
            $table->foreign('id_model')->references('id_model')->on('models')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('portfolios');
    }
};
