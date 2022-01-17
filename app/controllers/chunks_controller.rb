class ChunksController < ApplicationController
  def index
    query = request.query_parameters['q']
    return render json: { error: 'no query provided' } unless query.is_a?(String)

    cache = Cache.find_by input: query
    if !cache.nil? then
      render json: cache.output
      return
    end
    cache = Cache.new
    cache.input = query
    input = query
            .split(',')
            .map(&:to_f)
    chunks = input
             .chunk_while { |previous, current| previous < current }
    output = { input: input,
                  chunks: chunks,
                  max_length: chunks.max_by(&:length) }
    render json: output
    cache.output = output.to_json
    cache.save
  end
end
