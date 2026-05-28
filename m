Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 15C40CD5BD0
	for <webhook@archiver.kernel.org>; Thu, 28 May 2026 03:03:27 +0000 (UTC)
Received: from mail-qv1-f45.google.com (mail-qv1-f45.google.com [209.85.219.45])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.3155.1779937405333572112
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 27 May 2026 20:03:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20251104 header.b=YW8fhkmy;
 spf=pass (domain: gmail.com, ip: 209.85.219.45, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f45.google.com with SMTP id 6a1803df08f44-8acae26e564so156765676d6.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 27 May 2026 20:03:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779937404; x=1780542204; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=nQIId7XmP6HMmKP5V+OSk6ifi4+la9aoXQvVWzKSPLE=;
        b=YW8fhkmyS7Q9iQQmfI70drkAdjidAWpEiyww7jSqt3qNF7s5O0uVJUIN666Mi111kN
         d3keHMPFO2Pl528V8rA90UoqbW51VP/HJ0ZmZqjrCEa+BEhQW7yje5uRsTf+aE5reZ4l
         l6KOrhemB79yHk5tzPHp6oaJKsRhaOP7gqaJr+pltGxjXU39G82UsV1DSMWrNORt95/s
         quDLbz0stTSweXOxuudSw87nAZVPXbTGLOdAqNTW3lxMDCD5ao9Ed6BqxWrwtelX+V8Q
         KVgEIJENLUf8nWAO3qA28TUICWm9ugaLtCfuEiLSzoLc7HaaPwQGyQNfLS3eaZRJVAWp
         KBug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779937404; x=1780542204;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=nQIId7XmP6HMmKP5V+OSk6ifi4+la9aoXQvVWzKSPLE=;
        b=WruDKbI/cER99W3QtEy2iYE2AAFGCGN+5518u/RSLAEn3WQJZVGvvqMfBjcJ7ex/mn
         LItVSSVIYYtZjCMrrC+BORRinvZEky2s+Du7a6Hhktz3LMm474CBmKRhURk7TqMlxFpz
         qs+77ct4IXRJfObqooqyjgyVRNR0iyaoeoGvfkkBTtYL9AkAG9E6Ltx0G+Mmc3onNq8Y
         iw5MxxAZ4hF3A2rFvFOKcSqmtM8tk3djwxbm2OarTYoWuLgrJLUMjpJV87Egq0fbsn+8
         /CQMs0ul0p82EUgKI5bbtkPqWTlOy5FNEExBbj1zUv3coc8hCRb3qwQumw9AspjIeWvf
         xE9w==
X-Gm-Message-State: AOJu0YyZA+Z9DOfZFcmzjS/WN0eTbswRlI+/jElvizV3b9d/4N7thXFX
	S9JNFtynvVE3wM8xu69HeogdFLnUovWuP3XBgW0IAMCXBvQ/g/c3qppW4W2vP7q7
X-Gm-Gg: Acq92OHX73P/N9lgqxVksyyB8VdXhSN+1Z3aMv5YNZXs1mgKrf1d5bCyeD5VSzNabht
	BzxZ8PFTaOSROdX8qgVkIFsrf5ZZ+hHol+LEr2dWioW3lW80dLswiqLUA7deGpUkTtYqQK443F1
	s95n3LEU5rJ1OCQiiJmAQiEUmOBHspUtg5in4sHGmCzAzgG0Q6eXxpvOedT5XUDloIKYfkamKl/
	uYJRhApThyam4Q4Z7EgfcaClSxBKnau0mU5diFUYhfY8Px40ZIJn8vo+ppqTrHOh//4h5HffBS3
	zAIqcBmMEvy0V9SKozoGQAHs2PgNTUWMsXzhtdKWdUNb9nrFvebN9GEDPrknvQz9eYZTpOl0oJ0
	G/56HKaBTKMfbt4dR9p1DtaK54UBDqiRPKE3Bkl7db8+hnYh94Nyj6vpQ1MODppSbB0+PFbT101
	5vXBpIXB+hhsHLYi54cMVwM60rgcwEN1diGt7XDlf6gkoufHe2kcUqZiAdbMNLKjcimWkUu9SxB
	X+PKwP84mpRhF69b0pX/Pd1/Aoi5hOeXf6WgAFg74KpXgnOKLTieV09a10qsj7ATBE28Cv2UidX
	2LOPhRHxMWM51wRGKhZFpZzXr3lNTzgz
X-Received: by 2002:a05:6214:568e:b0:8cc:ccb:48d9 with SMTP id 6a1803df08f44-8cc7b691003mr426230996d6.38.1779937404078;
        Wed, 27 May 2026 20:03:24 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8cc81306c57sm188229626d6.34.2026.05.27.20.03.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 27 May 2026 20:03:23 -0700 (PDT)
Date: Thu, 28 May 2026 03:03:22 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: deeratho@cisco.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][scarthgap][PATCH 2/2] docker-moby: Fix
 CVE-2026-34040
Message-ID: <ahewetC7lbrMS3pP@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260513151011.3114690-1-deeratho@cisco.com>
 <20260513151104.3119869-1-deeratho@cisco.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Thu, 28 May 2026 03:03:27 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9821

merged.

Bruce

In message: [meta-virtualization][scarthgap][PATCH 2/2] docker-moby: Fix CVE-2026-34040
on 13/05/2026 Deepak Rathore via lists.yoctoproject.org wrote:

> From: Deepak Rathore <deeratho@cisco.com>
> 
> The upstream fix [3] & [4] referenced in the Debian security
> advisory [5] is present in the v25.0 branch, which aligns with the
> scarthgap branch so pick the corresponding commit [1] & [2] to apply
> the CVE fix.
> 
> [1] https://github.com/moby/moby/commit/553e8214614ee0d65ee309f148a8e865634cc291
> [2] https://github.com/moby/moby/commit/4d0135c2d25b89ecc62a15277f20177150195695
> [3] https://github.com/moby/moby/commit/6d311e0d8d4174a6347942db78c553fb7dc3762e
> [4] https://github.com/moby/moby/commit/db7dadaca041953430d1e2144088c311b78b96d7
> [5] https://security-tracker.debian.org/tracker/CVE-2026-34040
> 
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index 26dce276..eb493a43 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -57,6 +57,8 @@ SRC_URI = "\
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
>  		file://CVE-2026-33997.patch;patchdir=src/import \
> +		file://CVE-2026-34040_p1.patch;patchdir=src/import \
> +		file://CVE-2026-34040_p2.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2026-34040_p1.patch b/recipes-containers/docker/files/CVE-2026-34040_p1.patch
> new file mode 100644
> index 00000000..9fb96ab0
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2026-34040_p1.patch
> @@ -0,0 +1,215 @@
> +From b2ff8a60155731641418d1a8b9efaf9e044e1971 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
> +Date: Mon, 16 Feb 2026 14:15:24 +0100
> +Subject: [PATCH 1/2] pkg/authz: Reject requests exceeding body size limit
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Previously, the authorization system would silently skip body inspection when
> +request bodies exceeded the maximum size limit (1MiB).
> +
> +The authorization plugins would receive an empty body for inspection
> +while the actual large payload would still be processed by the Docker
> +daemon, allowing malicious requests to circumvent plugin-based security
> +controls.
> +
> +CVE: CVE-2026-34040
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/553e8214614ee0d65ee309f148a8e865634cc291]
> +
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit 7a767b27fd1238c89a5cc926c39e27d3bcf58e35)
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit 553e8214614ee0d65ee309f148a8e865634cc291)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + pkg/authorization/authz.go           | 56 ++++++-----------
> + pkg/authorization/authz_unix_test.go | 93 +++++++++++++++++++---------
> + 2 files changed, 83 insertions(+), 66 deletions(-)
> +
> +diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
> +index d568a2b597..3bc30f61cf 100644
> +--- a/pkg/authorization/authz.go
> ++++ b/pkg/authorization/authz.go
> +@@ -55,28 +55,31 @@ type Ctx struct {
> + 	authReq *Request
> + }
> + 
> +-func isChunked(r *http.Request) bool {
> +-	// RFC 7230 specifies that content length is to be ignored if Transfer-Encoding is chunked
> +-	if strings.EqualFold(r.Header.Get("Transfer-Encoding"), "chunked") {
> +-		return true
> +-	}
> +-	for _, v := range r.TransferEncoding {
> +-		if strings.EqualFold(v, "chunked") {
> +-			return true
> +-		}
> +-	}
> +-	return false
> +-}
> +-
> + // AuthZRequest authorized the request to the docker daemon using authZ plugins
> + func (ctx *Ctx) AuthZRequest(w http.ResponseWriter, r *http.Request) error {
> + 	var body []byte
> +-	if sendBody(ctx.requestURI, r.Header) && (r.ContentLength > 0 || isChunked(r)) && r.ContentLength < maxBodySize {
> +-		var err error
> +-		body, r.Body, err = drainBody(r.Body)
> +-		if err != nil {
> ++	if sendBody(ctx.requestURI, r.Header) {
> ++		// Wrap the original request body in a buffered reader so we can inspect
> ++		// the prefix without consuming bytes from the downstream reader.
> ++		// `Peek(maxBodySize + 1)` is used as a size check:
> ++		//   - err == nil means at least maxBodySize+1 bytes are buffered/available,
> ++		//     so the payload exceeds the plugin limit and is rejected.
> ++		//   - otherwise, `peeked` contains the complete body bytes currently available
> ++		//     (for short bodies this is the full payload), and reads from r.Body still
> ++		//     stream the original body unchanged.
> ++		bufBody := bufio.NewReaderSize(r.Body, maxBodySize+1)
> ++		r.Body = ioutils.NewReadCloserWrapper(bufBody, r.Body.Close)
> ++
> ++		peeked, err := bufBody.Peek(maxBodySize + 1)
> ++		if err == nil {
> ++			// Successfully peeked maxBodySize+1 bytes, so body is too large
> ++			// TODO: Allows plugin to opt in
> ++			return fmt.Errorf("request body too large for authorization plugin: size exceeds %d bytes", maxBodySize)
> ++		} else if err != io.EOF {
> + 			return err
> + 		}
> ++
> ++		body = peeked
> + 	}
> + 
> + 	var h bytes.Buffer
> +@@ -142,25 +145,6 @@ func (ctx *Ctx) AuthZResponse(rm ResponseModifier, r *http.Request) error {
> + 	return nil
> + }
> + 
> +-// drainBody dump the body (if its length is less than 1MB) without modifying the request state
> +-func drainBody(body io.ReadCloser) ([]byte, io.ReadCloser, error) {
> +-	bufReader := bufio.NewReaderSize(body, maxBodySize)
> +-	newBody := ioutils.NewReadCloserWrapper(bufReader, func() error { return body.Close() })
> +-
> +-	data, err := bufReader.Peek(maxBodySize)
> +-	// Body size exceeds max body size
> +-	if err == nil {
> +-		log.G(context.TODO()).Warnf("Request body is larger than: '%d' skipping body", maxBodySize)
> +-		return nil, newBody, nil
> +-	}
> +-	// Body size is less than maximum size
> +-	if err == io.EOF {
> +-		return data, newBody, nil
> +-	}
> +-	// Unknown error
> +-	return nil, newBody, err
> +-}
> +-
> + func isAuthEndpoint(urlPath string) (bool, error) {
> + 	// eg www.test.com/v1.24/auth/optional?optional1=something&optional2=something (version optional)
> + 	matched, err := regexp.MatchString(`^[^\/]*\/(v\d[\d\.]*\/)?auth.*`, urlPath)
> +diff --git a/pkg/authorization/authz_unix_test.go b/pkg/authorization/authz_unix_test.go
> +index 66b4d20452..c726e5f79a 100644
> +--- a/pkg/authorization/authz_unix_test.go
> ++++ b/pkg/authorization/authz_unix_test.go
> +@@ -139,36 +139,69 @@ func TestResponseModifier(t *testing.T) {
> + 	}
> + }
> + 
> +-func TestDrainBody(t *testing.T) {
> +-	tests := []struct {
> +-		length             int // length is the message length send to drainBody
> +-		expectedBodyLength int // expectedBodyLength is the expected body length after drainBody is called
> +-	}{
> +-		{10, 10},                           // Small message size
> +-		{maxBodySize - 1, maxBodySize - 1}, // Max message size
> +-		{maxBodySize * 2, 0},               // Large message size (skip copying body)
> +-
> +-	}
> +-
> +-	for _, test := range tests {
> +-		msg := strings.Repeat("a", test.length)
> +-		body, closer, err := drainBody(io.NopCloser(bytes.NewReader([]byte(msg))))
> +-		if err != nil {
> +-			t.Fatal(err)
> +-		}
> +-		if len(body) != test.expectedBodyLength {
> +-			t.Fatalf("Body must be copied, actual length: '%d'", len(body))
> +-		}
> +-		if closer == nil {
> +-			t.Fatal("Closer must not be nil")
> +-		}
> +-		modified, err := io.ReadAll(closer)
> +-		if err != nil {
> +-			t.Fatalf("Error must not be nil: '%v'", err)
> +-		}
> +-		if len(modified) != len(msg) {
> +-			t.Fatalf("Result should not be truncated. Original length: '%d', new length: '%d'", len(msg), len(modified))
> +-		}
> ++type recordingPlugin struct {
> ++	recordedRequest Request
> ++}
> ++
> ++func (p *recordingPlugin) Name() string { return "recording-plugin" }
> ++
> ++func (p *recordingPlugin) AuthZRequest(authReq *Request) (*Response, error) {
> ++	p.recordedRequest = *authReq
> ++	p.recordedRequest.RequestBody = bytes.Clone(authReq.RequestBody)
> ++	return &Response{Allow: true}, nil
> ++}
> ++
> ++func (p *recordingPlugin) AuthZResponse(_ *Request) (*Response, error) {
> ++	return &Response{Allow: true}, nil
> ++}
> ++
> ++func TestAuthZRequestBodyWithinLimit(t *testing.T) {
> ++	payload := strings.Repeat("a", maxBodySize)
> ++	plugin := &recordingPlugin{}
> ++	ctx := NewCtx([]Plugin{plugin}, "user", "tls", http.MethodPost, "/containers/create")
> ++
> ++	req := httptest.NewRequest(http.MethodPost, "http://example.com/containers/create", strings.NewReader(payload))
> ++	req.Header.Set("Content-Type", "application/json")
> ++
> ++	if err := ctx.AuthZRequest(httptest.NewRecorder(), req); err != nil {
> ++		t.Fatalf("AuthZRequest failed: %v", err)
> ++	}
> ++
> ++	if string(plugin.recordedRequest.RequestBody) != payload {
> ++		t.Fatalf("expected full request body to be sent to plugin, got length %d, expected %d", len(plugin.recordedRequest.RequestBody), len(payload))
> ++	}
> ++
> ++	remaining, err := io.ReadAll(req.Body)
> ++	if err != nil {
> ++		t.Fatalf("failed to read request body after authz: %v", err)
> ++	}
> ++	if string(remaining) != payload {
> ++		t.Fatalf("request body should be preserved for downstream readers")
> ++	}
> ++}
> ++
> ++func TestAuthZRequestBodyOverLimit(t *testing.T) {
> ++	payload := strings.Repeat("a", maxBodySize+1)
> ++	plugin := &recordingPlugin{}
> ++	ctx := NewCtx([]Plugin{plugin}, "user", "tls", http.MethodPost, "/containers/create")
> ++
> ++	req := httptest.NewRequest(http.MethodPost, "http://example.com/containers/create", strings.NewReader(payload))
> ++	req.Header.Set("Content-Type", "application/json")
> ++
> ++	err := ctx.AuthZRequest(httptest.NewRecorder(), req)
> ++	if err == nil {
> ++		t.Fatal("expected AuthZRequest to reject body over max size")
> ++	}
> ++	if !strings.Contains(err.Error(), "request body too large for authorization plugin") {
> ++		t.Fatalf("unexpected error: %v", err)
> ++	}
> ++
> ++	remaining, readErr := io.ReadAll(req.Body)
> ++	if readErr != nil {
> ++		t.Fatalf("failed to read request body after authz error: %v", readErr)
> ++	}
> ++	if string(remaining) != payload {
> ++		t.Fatalf("request body should still be preserved after over-limit check")
> + 	}
> + }
> + 
> +-- 
> +2.44.4
> +
> diff --git a/recipes-containers/docker/files/CVE-2026-34040_p2.patch b/recipes-containers/docker/files/CVE-2026-34040_p2.patch
> new file mode 100644
> index 00000000..00a264f0
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2026-34040_p2.patch
> @@ -0,0 +1,39 @@
> +From f24fa983ccaa393b64724292a49270ab46b49c06 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
> +Date: Mon, 16 Feb 2026 14:16:06 +0100
> +Subject: [PATCH 2/2] pkg/authz: Increase body limit to 4 MiB
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Some endpoint could potentially use a body request than 1 MiB without
> +malicious intent.
> +
> +CVE: CVE-2026-34040
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/4d0135c2d25b89ecc62a15277f2017715019569]
> +
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit ec76e941838797fc762185c556c152f0a032d387)
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit 4d0135c2d25b89ecc62a15277f20177150195695)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + pkg/authorization/authz.go | 2 +-
> + 1 file changed, 1 insertion(+), 1 deletion(-)
> +
> +diff --git a/pkg/authorization/authz.go b/pkg/authorization/authz.go
> +index 3bc30f61cf..e9221307a7 100644
> +--- a/pkg/authorization/authz.go
> ++++ b/pkg/authorization/authz.go
> +@@ -16,7 +16,7 @@ import (
> + 	"github.com/docker/docker/pkg/ioutils"
> + )
> + 
> +-const maxBodySize = 1048576 // 1MB
> ++const maxBodySize = 4 * 1024 * 1024 // 4MiB
> + 
> + // NewCtx creates new authZ context, it is used to store authorization information related to a specific docker
> + // REST http session
> +-- 
> +2.44.4
> +
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9795): https://lists.yoctoproject.org/g/meta-virtualization/message/9795
> Mute This Topic: https://lists.yoctoproject.org/mt/119298582/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


In message: [meta-virtualization][scarthgap][PATCH 1/2] docker-moby: Fix CVE-2026-33997
on 13/05/2026 Deepak Rathore via lists.yoctoproject.org wrote:

> From: Deepak Rathore <deeratho@cisco.com>
> 
> Pick the version-specific cherry-pick [1] of the upstream fix [2] mentioned in [3].
> 
> [1] https://github.com/moby/moby/commit/d5986c0430124d82ce87b439638d8ebb16916e40
> [2] https://github.com/moby/moby/commit/99a095ecf04e8849318f2811bb3f687905eab09b
> [3] https://security-tracker.debian.org/tracker/CVE-2026-33997
> 
> Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> 
> diff --git a/recipes-containers/docker/docker-moby_git.bb b/recipes-containers/docker/docker-moby_git.bb
> index e66416db..26dce276 100644
> --- a/recipes-containers/docker/docker-moby_git.bb
> +++ b/recipes-containers/docker/docker-moby_git.bb
> @@ -56,6 +56,7 @@ SRC_URI = "\
>  	file://0001-libnetwork-use-GO-instead-of-go.patch \
>          file://0001-cli-use-external-GO111MODULE-and-cross-compiler.patch \
>          file://0001-dynbinary-use-go-cross-compiler.patch;patchdir=src/import \
> +		file://CVE-2026-33997.patch;patchdir=src/import \
>  	"
>  
>  DOCKER_COMMIT = "${SRCREV_moby}"
> diff --git a/recipes-containers/docker/files/CVE-2026-33997.patch b/recipes-containers/docker/files/CVE-2026-33997.patch
> new file mode 100644
> index 00000000..9da4b3cf
> --- /dev/null
> +++ b/recipes-containers/docker/files/CVE-2026-33997.patch
> @@ -0,0 +1,179 @@
> +From 7e35ad066ee0c89e15fca9e9b95933b79ba315b7 Mon Sep 17 00:00:00 2001
> +From: =?UTF-8?q?Pawe=C5=82=20Gronowski?= <pawel.gronowski@docker.com>
> +Date: Thu, 19 Mar 2026 19:18:23 +0100
> +Subject: [PATCH] plugin: Fix off-by-one in privilege validation
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Fix an off-by-one error in isEqual() where the comparison loop started
> +at index 1 instead of 0, causing the first privilege (after sorting
> +alphabetically by name) to never be validated.
> +
> +This allowed a malicious plugin to request different values for
> +whichever privilege sorts first — most notably "allow-all-devices",
> +which grants unrestricted rwm access to all host devices.
> +
> +The bug also meant that plugins requesting exactly one privilege had
> +zero iterations of the comparison loop, bypassing validation entirely.
> +
> +Also fix an existing test case ("diff-order-but-same-value") that only
> +passed due to the off-by-one bug, and add test cases for single-element
> +and first-sorted-element mismatches.
> +
> +CVE: CVE-2026-33997
> +Upstream-Status: Backport [https://github.com/moby/moby/commit/d5986c0430124d82ce87b439638d8ebb16916e40]
> +
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit 99a095ecf04e8849318f2811bb3f687905eab09b)
> +Signed-off-by: Paweł Gronowski <pawel.gronowski@docker.com>
> +(cherry picked from commit d5986c0430124d82ce87b439638d8ebb16916e40)
> +Signed-off-by: Deepak Rathore <deeratho@cisco.com>
> +---
> + plugin/manager.go      | 50 ++++++++++++++++++++++++------------------
> + plugin/manager_test.go | 44 +++++++++++++++++++++++++++++++++----
> + 2 files changed, 69 insertions(+), 25 deletions(-)
> +
> +diff --git a/plugin/manager.go b/plugin/manager.go
> +index 81f3d67b80..d98b968c7d 100644
> +--- a/plugin/manager.go
> ++++ b/plugin/manager.go
> +@@ -1,14 +1,14 @@
> + package plugin // import "github.com/docker/docker/plugin"
> + 
> + import (
> ++	"cmp"
> + 	"context"
> + 	"encoding/json"
> + 	"io"
> + 	"os"
> + 	"path/filepath"
> +-	"reflect"
> + 	"regexp"
> +-	"sort"
> ++	"slices"
> + 	"strings"
> + 	"sync"
> + 	"syscall"
> +@@ -331,34 +331,42 @@ func makeLoggerStreams(id string) (stdout, stderr io.WriteCloser) {
> + }
> + 
> + func validatePrivileges(requiredPrivileges, privileges types.PluginPrivileges) error {
> +-	if !isEqual(requiredPrivileges, privileges, isEqualPrivilege) {
> ++	if len(requiredPrivileges) != len(privileges) {
> + 		return errors.New("incorrect privileges")
> + 	}
> + 
> +-	return nil
> +-}
> +-
> +-func isEqual(arrOne, arrOther types.PluginPrivileges, compare func(x, y types.PluginPrivilege) bool) bool {
> +-	if len(arrOne) != len(arrOther) {
> +-		return false
> +-	}
> +-
> +-	sort.Sort(arrOne)
> +-	sort.Sort(arrOther)
> ++	a := normalizePrivileges(requiredPrivileges)
> ++	b := normalizePrivileges(privileges)
> + 
> +-	for i := 1; i < arrOne.Len(); i++ {
> +-		if !compare(arrOne[i], arrOther[i]) {
> +-			return false
> ++	for i := range a {
> ++		if a[i].Name != b[i].Name {
> ++			return errors.New("incorrect privileges")
> ++		}
> ++		if !slices.Equal(a[i].Value, b[i].Value) {
> ++			return errors.New("incorrect privileges")
> + 		}
> + 	}
> + 
> +-	return true
> ++	return nil
> + }
> + 
> +-func isEqualPrivilege(a, b types.PluginPrivilege) bool {
> +-	if a.Name != b.Name {
> +-		return false
> ++// normalizePrivileges returns a normalized copy of privileges with privilege names
> ++// and each privilege's values sorted for order-insensitive comparison.
> ++// The input is not mutated.
> ++func normalizePrivileges(privileges types.PluginPrivileges) types.PluginPrivileges {
> ++	normalized := make(types.PluginPrivileges, len(privileges))
> ++	for i, privilege := range privileges {
> ++		normalized[i] = types.PluginPrivilege{
> ++			Name:        privilege.Name,
> ++			Description: privilege.Description,
> ++			Value:       slices.Clone(privilege.Value),
> ++		}
> ++		slices.Sort(normalized[i].Value)
> + 	}
> + 
> +-	return reflect.DeepEqual(a.Value, b.Value)
> ++	slices.SortFunc(normalized, func(a, b types.PluginPrivilege) int {
> ++		return cmp.Compare(a.Name, b.Name)
> ++	})
> ++
> ++	return normalized
> + }
> +diff --git a/plugin/manager_test.go b/plugin/manager_test.go
> +index 62ccf2149d..6d58865044 100644
> +--- a/plugin/manager_test.go
> ++++ b/plugin/manager_test.go
> +@@ -44,12 +44,48 @@ func TestValidatePrivileges(t *testing.T) {
> + 			},
> + 			result: true,
> + 		},
> ++		"single-element-same": {
> ++			requiredPrivileges: []types.PluginPrivilege{
> ++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
> ++			},
> ++			privileges: []types.PluginPrivilege{
> ++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
> ++			},
> ++			result: true,
> ++		},
> ++		"single-element-diff-value": {
> ++			requiredPrivileges: []types.PluginPrivilege{
> ++				{Name: "allow-all-devices", Description: "Description", Value: []string{"false"}},
> ++			},
> ++			privileges: []types.PluginPrivilege{
> ++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
> ++			},
> ++			result: false,
> ++		},
> ++		"first-sorted-element-diff-value": {
> ++			requiredPrivileges: []types.PluginPrivilege{
> ++				{Name: "allow-all-devices", Description: "Description", Value: []string{"false"}},
> ++				{Name: "network", Description: "Description", Value: []string{"host"}},
> ++			},
> ++			privileges: []types.PluginPrivilege{
> ++				{Name: "allow-all-devices", Description: "Description", Value: []string{"true"}},
> ++				{Name: "network", Description: "Description", Value: []string{"host"}},
> ++			},
> ++			result: false,
> ++		},
> ++		"empty-privileges": {
> ++			requiredPrivileges: []types.PluginPrivilege{},
> ++			privileges:         []types.PluginPrivilege{},
> ++			result:             true,
> ++		},
> + 	}
> + 
> + 	for key, data := range testData {
> +-		err := validatePrivileges(data.requiredPrivileges, data.privileges)
> +-		if (err == nil) != data.result {
> +-			t.Fatalf("Test item %s expected result to be %t, got %t", key, data.result, (err == nil))
> +-		}
> ++		t.Run(key, func(t *testing.T) {
> ++			err := validatePrivileges(data.requiredPrivileges, data.privileges)
> ++			if (err == nil) != data.result {
> ++				t.Fatalf("expected result to be %t, got %t", data.result, (err == nil))
> ++			}
> ++		})
> + 	}
> + }
> +-- 
> +2.44.4
> +
> -- 
> 2.35.6
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9794): https://lists.yoctoproject.org/g/meta-virtualization/message/9794
> Mute This Topic: https://lists.yoctoproject.org/mt/119298567/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 



