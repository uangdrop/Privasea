# Switch to the program running directory
cd /privasea/

# Ask for the keystore password
echo "🔐 Please enter your keystore password:"
read -s KEYSTORE_PASSWORD

# Run the compute node command with the provided password
container_id=$(docker run -d   -v "/privasea/config:/app/config" \
  -e KEYSTORE_PASSWORD=$KEYSTORE_PASSWORD \
  privasea/acceleration-node-beta:latest)

# Check if the container started successfully
if [ -z "$container_id" ]; then
    echo "❌ Error: Failed to start the container. Exiting."
    exit 1
fi

# Display the container ID
echo "✅ Container started successfully. Container ID: $container_id"

# Command to check the node's running status
echo "📊 Checking the node's running status..."
docker logs -f $container_id


    echo "✅ Setup completed successfully!"
    echo "Please note down your node address and keystore password for future reference."
    break # Exit the loop if everything is successful
done
