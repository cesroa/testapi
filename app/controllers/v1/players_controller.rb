module V1
	class PlayersController < ApplicationController
		def index
			players = Player.order('created_at DESC')
			render json:{status: 'COMPLETADO', message: 'Aquí estan todas los jugadores', data:players}, status: :ok
		end

		def create
			playern = Player.new(player_params)
			if playern.save
				render json:{status:"HECHO", message:"Se guardó el nuevo jugador", data:playern}, status: :ok
			else
				render json:{status:"ERROR", message:"No se pudo guardar, hubo un error", data:playern}, status: :unprocessable_entity
			end
		end

		def show
			playerf = Player.find(params[:id])
			render json:{status:"ENCONTRADO", message:"Jugador encontrado en la base de datos", data:playerf}, status: :ok
		end

		def update
			playeru = Player.find(params[:id])
			playeru.update_attributes(player_params)

			render json:{status:"ACTUALIZADO", message:"Los datos del jugador se han acutalizado", data:playeru}, status: :ok
		end

		def destroy
			playerd = Player.find(params[:id])
			playerd.destroy

			render json:{status:"ELIMINADO", message:"El jugador se ha eliminado de los registros", data:playerd}, status: :ok
		end

		private def player_params
			params.permit(:name, :team)
		end
	end
end