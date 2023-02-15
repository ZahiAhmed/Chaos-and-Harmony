class Api::MessagesController < ApplicationController
    before_action :require_logged_in

    def create
        @message = Message.new(channel_id: params[:channel_id], author_id: params[:author_id], body: params[:body])
        if @message.save
            render :show, locals: {message: @message}
        else
            render json: @message.errors.full_messages, status: 418
        end
    end
    
    def update
        @message = Message.find_by(id: params[:id])
        if (@message&.update(
            channel_id: params[:channel_id],
            author_id: params[:author_id],
            body: params[:body]
        )) && (@message.owner_id == current_user.id)
            render :show, locals: {message: @message}
        end
        if (@message.body == '')
            @message.destroy
        end
    end

    def destroy
        @message = Message.find_by(id: params[:id])
        if current_user.id == @message.author_id
            @message.destroy
        end
    end

end

