module V1
	class TestersController < ApplicationController
		def index
			testers = Tester.order('created_at DESC')
			render json:{status: 'COMPLETADO', message: 'Aquí estan todas las películas', data:testers}, status: :ok
		end

		def create
			tester = Tester.new(tester_params)
			if tester.save
				render json:{status: "GUARDADO", message: 'Los datos se guardaron', data:tester}, status: :ok
			else
				render json:{status: "ERROR", message: 'Hubo en el error al momento de guardar',data:tester}, status: :unprocessable_entity
			end
		end

		def show
			tester = Tester.find(params[:id])
			#if tester
				render json:{status:"ENCONTRADO", message: "Se encontró la película", data:tester}, status: :ok
			#elsif tester.empty?				
			#	render json:{status:"NO SE ENCUENTRA", message:"No existe en el registro", data:tester}, status: :unprocessable_entity
			#end
		end

		def update
			testerm = Tester.find(params[:id])
			if testerm.update_attributes(tester_params)
				render json:{status:"ACTUALIZADO", message: "Los datos se han actualizado", data:testerm}, status: :ok
			else
				render json:{status:"ERROR", message: "No se puedieron actualizar los datos", data:testerm}, status: :unprocessable_entity				
			end
		end

		def destroy
			testerd = Tester.find(params[:id])
			if testerd.destroy
				render json:{status:"ELIMINADO", message: "La película se ha eliminado", data:testerd}, status: :ok
			else
				render json:{status:"ERROR", message:"No se pudo eliminar",data:testerd}, status: :unprocessable_entity
			end			
		end

		private def tester_params
			params.permit(:movie, :director, :year, :score)
		end
	end
end