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
        Schema::create('visitor', function (Blueprint $table) {
            $table->id();
            $table->string('ip_address', 45);
            $table->datetime('visited_at')->useCurrent();
            $table->string('session_id', 255)->nullable();
            $table->text('user_agent')->nullable();
            $table->timestamp('last_activity')->nullable();
            $table->boolean('is_online')->default(0);
            $table->unsignedBigInteger('user_id')->nullable();
            
            $table->index('session_id');
            $table->index('is_online');
            $table->index('last_activity');
            $table->index('user_id');
        });
    }

    /**
     * Reverse the migrations.
     */
    public function down(): void
    {
        Schema::dropIfExists('visitor');
    }
};
