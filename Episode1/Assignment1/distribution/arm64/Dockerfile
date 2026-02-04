# Android XML Validator - Base Image
# Used for validating Android XML layouts with pytest
# Base image for all assignments

FROM alpine:3.19

# Install required packages
RUN apk add --no-cache \
    python3 \
    py3-pip \
    libxml2-utils \
    bash \
    && rm -rf /var/cache/apk/*

# Install Python dependencies with --break-system-packages for Alpine
RUN pip3 install --no-cache-dir --break-system-packages \
    pytest==9.0.1 \
    pytest-json-report==1.5.0 \
    lxml==4.9.3 \
    defusedxml>=0.0.4

# Create validator user (non-root)
RUN addgroup -g 1000 validator && \
    adduser -D -u 1000 -G validator validator

# Create validator and submission directories
RUN mkdir -p /validator && \
    mkdir -p /submission && \
    chown -R validator:validator /validator && \
    chown -R validator:validator /submission

# Copy validator scripts into image (so they're always available)
COPY validator.sh /validator/validator.sh
COPY validate_xml.py /validator/validate_xml.py
COPY enhance_json.py /validator/enhance_json.py

# Make scripts executable BEFORE switching to non-root user
RUN chmod +x /validator/validator.sh /validator/validate_xml.py /validator/enhance_json.py

# Set working directory
WORKDIR /validator

# Switch to non-root user
USER validator

# Health check
HEALTHCHECK --interval=30s --timeout=3s --start-period=5s --retries=3 \
    CMD test -f /tmp/validator_ready 2>/dev/null || exit 1

# Default command
CMD ["/validator/validator.sh", "init"]
