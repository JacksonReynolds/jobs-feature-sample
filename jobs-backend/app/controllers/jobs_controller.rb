class JobsController < ApplicationController
  def index
    render json: Job.all, :status => 200
  end

  def create
    job = Job.new(job_params)
    if job.save
      render json: job, :status => 201
    else
      render json: {msg: job.errors.full_messages.join(', ')}, :status => 500
    end
  end

  def update
    job = Job.find_by(id: params[:id])
    if job.update(job_params)
      render json: job, :status => 200
    else
      render json: {msg: job.errors.full_messages.join(', ')}, :status => 500
    end
  end

  def destroy
    job = Job.find_by(id: params[:job][:id])
    if job.destroy
      render json: {success: true}, :status => 200
    else
      render json: {msg: 'Please delete a valid job'}, :status => 500
    end
  end

  private

  def job_params
    params.require(:job).permit(:id, :title, :description, skills: [])
  end
end
