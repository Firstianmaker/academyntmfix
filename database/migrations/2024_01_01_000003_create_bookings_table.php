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
        Schema::create('bookings', function (Blueprint $table) {
            $table->id('id_bookings');
            $table->unsignedBigInteger('id_model')->nullable();
            $table->unsignedBigInteger('id_user')->nullable();
            $table->text('message')->nullable();
            $table->timestamp('created_at')->useCurrent();
            
            $table->foreign('id_model')->references('id_model')->on('models')->onDelete('cascade');
            $table->foreign('id_user')->references('id_user')->on('users')->onDelete('cascade');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('bookings');
    }
};
