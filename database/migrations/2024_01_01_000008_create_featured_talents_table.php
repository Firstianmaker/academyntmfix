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
        Schema::create('featured_talents', function (Blueprint $table) {
            $table->id();
            $table->unsignedBigInteger('id_model')->nullable();
            $table->integer('order')->default(0);
            $table->timestamps();
            
            $table->foreign('id_model')->references('id_model')->on('models')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('featured_talents');
    }
};
