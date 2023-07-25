Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C879EC001DE
	for <webhook@archiver.kernel.org>; Tue, 25 Jul 2023 18:53:25 +0000 (UTC)
Received: from mail-oi1-f169.google.com (mail-oi1-f169.google.com [209.85.167.169])
 by mx.groups.io with SMTP id smtpd.web11.28539.1690311204701774697
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 25 Jul 2023 11:53:24 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=HPC5UzA1;
 spf=pass (domain: gmail.com, ip: 209.85.167.169, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-oi1-f169.google.com with SMTP id 5614622812f47-3a36b30aa7bso3958821b6e.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jul 2023 11:53:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690311204; x=1690916004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=g96C3bTBNRZRemDsX5J/+VRqY1QNpueJvnBbxcLOYdc=;
        b=HPC5UzA1UqL+IXcduii9JUXFGuWXbfVgXE0QTzYbpcic6Vd/RmLSDd5okAwOAwUCir
         GqqL9gtsanbO1HyHB8JOMRLgT/20j54S3jv4QUUs+pjCH+jxPQ5tNOcRRTsHCmd4Yf30
         0ZYBoLxNwl2joMOiJPcWPKnvKzpRZYGLct5INHs3NcyoxSDvO0epUIKSZs10bva+OSVg
         tAWrwZhl9BlFXPApJk+a5kO6o5b6PtgI3suusKwQcZhuyVYXfVQaRuzSV8nTjD5092gs
         kAjdX2MvwBqqQ7LbRmSQ5XZXRVtyJrxLO7X17Fuy7EHJxrxsV5ACVOAANV/V8kIIAjeD
         Edog==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690311204; x=1690916004;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=g96C3bTBNRZRemDsX5J/+VRqY1QNpueJvnBbxcLOYdc=;
        b=avnjuTZzrrUPJb2w236KTy2/Laa9sE7hF8/KoxwS8eK158Pr75jSekev1fo/Uu5Vvv
         wh/qOR8sfPazliiea6sljlt/GGLiucLM29gKcUkY6i1hfU7NEPIFsvzNEwBaX475slqA
         imbbny7AzX4phrELbNlCzuHo2LhyBVxS1szAHN4veg7P3x9dbAQaqEuWRA8kHaBeTdEN
         dPlOq0hvwarBgdATwulapcaNGZWNm+2Kpjre4jerXtS0JrwzzV6HvDQeptIu3NCcp5xE
         Ss9i320PiqdH5L+79tp98hxIQRhaRZjhA+US62xIspi3MTtq8EtGOMO0ke4fTrhqBcId
         DRvA==
X-Gm-Message-State: ABy/qLZIaB1uun34if4Q46NNr6aQaEis8PI3Hroi4qqP1rxprQAqqv8x
	Jk40zx27gYvqq//xlAraeB3rtFV118jfHg==
X-Google-Smtp-Source: APBJJlHoBM78p7EPoUDm5EWePvEANatJK2vykSQMRGlM0kq+QDj2L3dl6GzL0gvTQ9pgoTfhqWWPDQ==
X-Received: by 2002:a54:4784:0:b0:3a3:7b77:bb2d with SMTP id o4-20020a544784000000b003a37b77bb2dmr11466369oic.13.1690311203623;
        Tue, 25 Jul 2023 11:53:23 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id w2-20020a0ce102000000b0063642bcc5e4sm4546964qvk.9.2023.07.25.11.53.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 25 Jul 2023 11:53:21 -0700 (PDT)
Date: Tue, 25 Jul 2023 14:53:20 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: narpat.mali@windriver.com
Cc: meta-virtualization@lists.yoctoproject.org, hari.gpillai@windriver.com
Subject: Re: [meta-virtualization][mickledore][PATCH 1/1]
 docker-distribution: fix for CVE-2023-2253
Message-ID: <ZMAaIEccTEeFgVNI@gmail.com>
References: <20230724084318.1082352-1-narpat.mali@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20230724084318.1082352-1-narpat.mali@windriver.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 25 Jul 2023 18:53:25 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8134

merged.

Bruce


In message: [meta-virtualization][mickledore][PATCH 1/1] docker-distribution: fix for CVE-2023-2253
on 24/07/2023 Narpat Mali via lists.yoctoproject.org wrote:

> From: Narpat Mali <narpat.mali@windriver.com>
> 
> A flaw was found in the `/v2/_catalog` endpoint in distribution/distribution,
> which accepts a parameter to control the maximum number of records returned
> (query string: `n`). This vulnerability allows a malicious user to submit an
> unreasonably large value for `n,` causing the allocation of a massive string
> array, possibly causing a denial of service through excessive use of memory.
> 
> References:
> https://github.com/distribution/distribution/security/advisories/GHSA-hqxw-f8mx-cpmw
> https://github.com/distribution/distribution/commit/521ea3d973cb0c7089ebbcdd4ccadc34be941f54
> 
> Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> ---
>  .../docker-distribution_git.bb                |   1 +
>  ...ix-runaway-allocation-on-v2-_catalog.patch | 669 ++++++++++++++++++
>  2 files changed, 670 insertions(+)
>  create mode 100644 recipes-containers/docker-distribution/files/0001-Fix-runaway-allocation-on-v2-_catalog.patch
> 
> diff --git a/recipes-containers/docker-distribution/docker-distribution_git.bb b/recipes-containers/docker-distribution/docker-distribution_git.bb
> index d05d0131..74bc2cb5 100644
> --- a/recipes-containers/docker-distribution/docker-distribution_git.bb
> +++ b/recipes-containers/docker-distribution/docker-distribution_git.bb
> @@ -7,6 +7,7 @@ SRCREV_distribution= "dc5b207fdd294c57dfef59017df60088b27d2668"
>  SRC_URI = "git://github.com/docker/distribution.git;branch=release/2.8;name=distribution;destsuffix=git/src/github.com/docker/distribution;protocol=https \
>             file://docker-registry.service \
>             file://0001-build-use-to-use-cross-go-compiler.patch \
> +           file://0001-Fix-runaway-allocation-on-v2-_catalog.patch \
>            "
>  
>  PACKAGES =+ "docker-registry"
> diff --git a/recipes-containers/docker-distribution/files/0001-Fix-runaway-allocation-on-v2-_catalog.patch b/recipes-containers/docker-distribution/files/0001-Fix-runaway-allocation-on-v2-_catalog.patch
> new file mode 100644
> index 00000000..69da7054
> --- /dev/null
> +++ b/recipes-containers/docker-distribution/files/0001-Fix-runaway-allocation-on-v2-_catalog.patch
> @@ -0,0 +1,669 @@
> +From 521ea3d973cb0c7089ebbcdd4ccadc34be941f54 Mon Sep 17 00:00:00 2001
> +From: "Jose D. Gomez R" <jose.gomez@suse.com>
> +Date: Mon, 24 Apr 2023 18:52:27 +0200
> +Subject: [PATCH] Fix runaway allocation on /v2/_catalog
> +MIME-Version: 1.0
> +Content-Type: text/plain; charset=UTF-8
> +Content-Transfer-Encoding: 8bit
> +
> +Introduced a Catalog entry in the configuration struct. With it,
> +it's possible to control the maximum amount of entries returned
> +by /v2/catalog (`GetCatalog` in registry/handlers/catalog.go).
> +
> +It's set to a default value of 1000.
> +
> +`GetCatalog` returns 100 entries by default if no `n` is
> +provided. When provided it will be validated to be between `0`
> +and `MaxEntries` defined in Configuration. When `n` is outside
> +the aforementioned boundary, ErrorCodePaginationNumberInvalid is
> +returned.
> +
> +`GetCatalog` now handles `n=0` gracefully with an empty response
> +as well.
> +
> +Signed-off-by: Jos� D. G�mez R. <1josegomezr@gmail.com>
> +Co-authored-by: Cory Snider <corhere@gmail.com>
> +
> +CVE: CVE-2023-2253
> +
> +Upstream-Status: Backport [https://github.com/distribution/distribution/commit/521ea3d973cb0c7089ebbcdd4ccadc34be941f54]
> +
> +Signed-off-by: Narpat Mali <narpat.mali@windriver.com>
> +---
> + configuration/configuration.go      |  18 +-
> + configuration/configuration_test.go |   4 +
> + registry/api/v2/descriptors.go      |  17 ++
> + registry/api/v2/errors.go           |   9 +
> + registry/handlers/api_test.go       | 316 +++++++++++++++++++++++++---
> + registry/handlers/catalog.go        |  54 +++--
> + 6 files changed, 376 insertions(+), 42 deletions(-)
> +
> +diff --git a/configuration/configuration.go b/configuration/configuration.go
> +index dd315485..1e696613 100644
> +--- a/configuration/configuration.go
> ++++ b/configuration/configuration.go
> +@@ -193,7 +193,8 @@ type Configuration struct {
> +		} `yaml:"pool,omitempty"`
> +	} `yaml:"redis,omitempty"`
> +
> +-	Health Health `yaml:"health,omitempty"`
> ++	Health  Health  `yaml:"health,omitempty"`
> ++	Catalog Catalog `yaml:"catalog,omitempty"`
> +
> +	Proxy Proxy `yaml:"proxy,omitempty"`
> +
> +@@ -244,6 +245,16 @@ type Configuration struct {
> +	} `yaml:"policy,omitempty"`
> + }
> +
> ++// Catalog is composed of MaxEntries.
> ++// Catalog endpoint (/v2/_catalog) configuration, it provides the configuration
> ++// options to control the maximum number of entries returned by the catalog endpoint.
> ++type Catalog struct {
> ++	// Max number of entries returned by the catalog endpoint. Requesting n entries
> ++	// to the catalog endpoint will return at most MaxEntries entries.
> ++	// An empty or a negative value will set a default of 1000 maximum entries by default.
> ++	MaxEntries int `yaml:"maxentries,omitempty"`
> ++}
> ++
> + // LogHook is composed of hook Level and Type.
> + // After hooks configuration, it can execute the next handling automatically,
> + // when defined levels of log message emitted.
> +@@ -670,6 +681,11 @@ func Parse(rd io.Reader) (*Configuration, error) {
> +					if v0_1.Loglevel != Loglevel("") {
> +						v0_1.Loglevel = Loglevel("")
> +					}
> ++
> ++					if v0_1.Catalog.MaxEntries <= 0 {
> ++						v0_1.Catalog.MaxEntries = 1000
> ++					}
> ++
> +					if v0_1.Storage.Type() == "" {
> +						return nil, errors.New("no storage configuration provided")
> +					}
> +diff --git a/configuration/configuration_test.go b/configuration/configuration_test.go
> +index 0d6136e1..48cc9980 100644
> +--- a/configuration/configuration_test.go
> ++++ b/configuration/configuration_test.go
> +@@ -71,6 +71,9 @@ var configStruct = Configuration{
> +			},
> +		},
> +	},
> ++	Catalog: Catalog{
> ++		MaxEntries: 1000,
> ++	},
> +	HTTP: struct {
> +		Addr         string        `yaml:"addr,omitempty"`
> +		Net          string        `yaml:"net,omitempty"`
> +@@ -524,6 +527,7 @@ func copyConfig(config Configuration) *Configuration {
> +	configCopy.Version = MajorMinorVersion(config.Version.Major(), config.Version.Minor())
> +	configCopy.Loglevel = config.Loglevel
> +	configCopy.Log = config.Log
> ++	configCopy.Catalog = config.Catalog
> +	configCopy.Log.Fields = make(map[string]interface{}, len(config.Log.Fields))
> +	for k, v := range config.Log.Fields {
> +		configCopy.Log.Fields[k] = v
> +diff --git a/registry/api/v2/descriptors.go b/registry/api/v2/descriptors.go
> +index a9616c58..c3bf90f7 100644
> +--- a/registry/api/v2/descriptors.go
> ++++ b/registry/api/v2/descriptors.go
> +@@ -134,6 +134,19 @@ var (
> +		},
> +	}
> +
> ++	invalidPaginationResponseDescriptor = ResponseDescriptor{
> ++		Name:        "Invalid pagination number",
> ++		Description: "The received parameter n was invalid in some way, as described by the error code. The client should resolve the issue and retry the request.",
> ++		StatusCode:  http.StatusBadRequest,
> ++		Body: BodyDescriptor{
> ++			ContentType: "application/json",
> ++			Format:      errorsBody,
> ++		},
> ++		ErrorCodes: []errcode.ErrorCode{
> ++			ErrorCodePaginationNumberInvalid,
> ++		},
> ++	}
> ++
> +	repositoryNotFoundResponseDescriptor = ResponseDescriptor{
> +		Name:        "No Such Repository Error",
> +		StatusCode:  http.StatusNotFound,
> +@@ -490,6 +503,7 @@ var routeDescriptors = []RouteDescriptor{
> +							},
> +						},
> +						Failures: []ResponseDescriptor{
> ++							invalidPaginationResponseDescriptor,
> +							unauthorizedResponseDescriptor,
> +							repositoryNotFoundResponseDescriptor,
> +							deniedResponseDescriptor,
> +@@ -1578,6 +1592,9 @@ var routeDescriptors = []RouteDescriptor{
> +								},
> +							},
> +						},
> ++						Failures: []ResponseDescriptor{
> ++							invalidPaginationResponseDescriptor,
> ++						},
> +					},
> +				},
> +			},
> +diff --git a/registry/api/v2/errors.go b/registry/api/v2/errors.go
> +index 97d6923a..87e9f3c1 100644
> +--- a/registry/api/v2/errors.go
> ++++ b/registry/api/v2/errors.go
> +@@ -133,4 +133,13 @@ var (
> +		longer proceed.`,
> +		HTTPStatusCode: http.StatusNotFound,
> +	})
> ++
> ++	ErrorCodePaginationNumberInvalid = errcode.Register(errGroup, errcode.ErrorDescriptor{
> ++		Value:   "PAGINATION_NUMBER_INVALID",
> ++		Message: "invalid number of results requested",
> ++		Description: `Returned when the "n" parameter (number of results
> ++		to return) is not an integer, "n" is negative or "n" is bigger than
> ++		the maximum allowed.`,
> ++		HTTPStatusCode: http.StatusBadRequest,
> ++	})
> + )
> +diff --git a/registry/handlers/api_test.go b/registry/handlers/api_test.go
> +index 2d3edc74..bf037d45 100644
> +--- a/registry/handlers/api_test.go
> ++++ b/registry/handlers/api_test.go
> +@@ -81,21 +81,23 @@ func TestCheckAPI(t *testing.T) {
> +
> + // TestCatalogAPI tests the /v2/_catalog endpoint
> + func TestCatalogAPI(t *testing.T) {
> +-	chunkLen := 2
> +	env := newTestEnv(t, false)
> +	defer env.Shutdown()
> +
> +-	values := url.Values{
> +-		"last": []string{""},
> +-		"n":    []string{strconv.Itoa(chunkLen)}}
> ++	maxEntries := env.config.Catalog.MaxEntries
> ++	allCatalog := []string{
> ++		"foo/aaaa", "foo/bbbb", "foo/cccc", "foo/dddd", "foo/eeee", "foo/ffff",
> ++	}
> +
> +-	catalogURL, err := env.builder.BuildCatalogURL(values)
> ++	chunkLen := maxEntries - 1
> ++
> ++	catalogURL, err := env.builder.BuildCatalogURL()
> +	if err != nil {
> +		t.Fatalf("unexpected error building catalog url: %v", err)
> +	}
> +
> +	// -----------------------------------
> +-	// try to get an empty catalog
> ++	// Case No. 1: Empty catalog
> +	resp, err := http.Get(catalogURL)
> +	if err != nil {
> +		t.Fatalf("unexpected error issuing request: %v", err)
> +@@ -113,23 +115,22 @@ func TestCatalogAPI(t *testing.T) {
> +		t.Fatalf("error decoding fetched manifest: %v", err)
> +	}
> +
> +-	// we haven't pushed anything to the registry yet
> ++	// No images pushed = no image returned
> +	if len(ctlg.Repositories) != 0 {
> +-		t.Fatalf("repositories has unexpected values")
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", 0, len(ctlg.Repositories))
> +	}
> +
> ++	// No pagination should be returned
> +	if resp.Header.Get("Link") != "" {
> +		t.Fatalf("repositories has more data when none expected")
> +	}
> +
> +-	// -----------------------------------
> +-	// push something to the registry and try again
> +-	images := []string{"foo/aaaa", "foo/bbbb", "foo/cccc"}
> +-
> +-	for _, image := range images {
> ++	for _, image := range allCatalog {
> +		createRepository(env, t, image, "sometag")
> +	}
> +
> ++	// -----------------------------------
> ++	// Case No. 2: Catalog populated & n is not provided nil (n internally will be min(100, maxEntries))
> +	resp, err = http.Get(catalogURL)
> +	if err != nil {
> +		t.Fatalf("unexpected error issuing request: %v", err)
> +@@ -143,27 +144,60 @@ func TestCatalogAPI(t *testing.T) {
> +		t.Fatalf("error decoding fetched manifest: %v", err)
> +	}
> +
> +-	if len(ctlg.Repositories) != chunkLen {
> +-		t.Fatalf("repositories has unexpected values")
> ++	// it must match max entries
> ++	if len(ctlg.Repositories) != maxEntries {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", maxEntries, len(ctlg.Repositories))
> +	}
> +
> +-	for _, image := range images[:chunkLen] {
> ++	// it must return the first maxEntries entries from the catalog
> ++	for _, image := range allCatalog[:maxEntries] {
> +		if !contains(ctlg.Repositories, image) {
> +			t.Fatalf("didn't find our repository '%s' in the catalog", image)
> +		}
> +	}
> +
> ++	// fail if there's no pagination
> +	link := resp.Header.Get("Link")
> +	if link == "" {
> +		t.Fatalf("repositories has less data than expected")
> +	}
> ++	// -----------------------------------
> ++	// Case No. 2.1: Second page (n internally will be min(100, maxEntries))
> ++
> ++	// build pagination link
> ++	values := checkLink(t, link, maxEntries, ctlg.Repositories[len(ctlg.Repositories)-1])
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> +
> +-	newValues := checkLink(t, link, chunkLen, ctlg.Repositories[len(ctlg.Repositories)-1])
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	expectedRemainder := len(allCatalog) - maxEntries
> ++	if len(ctlg.Repositories) != expectedRemainder {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", expectedRemainder, len(ctlg.Repositories))
> ++	}
> +
> +	// -----------------------------------
> +-	// get the last chunk of data
> ++	// Case No. 3: request n = maxentries
> ++	values = url.Values{
> ++		"last": []string{""},
> ++		"n":    []string{strconv.Itoa(maxEntries)},
> ++	}
> +
> +-	catalogURL, err = env.builder.BuildCatalogURL(newValues)
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> +	if err != nil {
> +		t.Fatalf("unexpected error building catalog url: %v", err)
> +	}
> +@@ -181,18 +215,239 @@ func TestCatalogAPI(t *testing.T) {
> +		t.Fatalf("error decoding fetched manifest: %v", err)
> +	}
> +
> +-	if len(ctlg.Repositories) != 1 {
> +-		t.Fatalf("repositories has unexpected values")
> ++	if len(ctlg.Repositories) != maxEntries {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", maxEntries, len(ctlg.Repositories))
> +	}
> +
> +-	lastImage := images[len(images)-1]
> +-	if !contains(ctlg.Repositories, lastImage) {
> +-		t.Fatalf("didn't find our repository '%s' in the catalog", lastImage)
> ++	// fail if there's no pagination
> ++	link = resp.Header.Get("Link")
> ++	if link == "" {
> ++		t.Fatalf("repositories has less data than expected")
> ++	}
> ++
> ++	// -----------------------------------
> ++	// Case No. 3.1: Second (last) page
> ++
> ++	// build pagination link
> ++	values = checkLink(t, link, maxEntries, ctlg.Repositories[len(ctlg.Repositories)-1])
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> +	}
> +
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	expectedRemainder = len(allCatalog) - maxEntries
> ++	if len(ctlg.Repositories) != expectedRemainder {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", expectedRemainder, len(ctlg.Repositories))
> ++	}
> ++
> ++	// -----------------------------------
> ++	// Case No. 4: request n < maxentries
> ++	values = url.Values{
> ++		"n": []string{strconv.Itoa(chunkLen)},
> ++	}
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	// returns the requested amount
> ++	if len(ctlg.Repositories) != chunkLen {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", expectedRemainder, len(ctlg.Repositories))
> ++	}
> ++
> ++	// fail if there's no pagination
> +	link = resp.Header.Get("Link")
> +-	if link != "" {
> +-		t.Fatalf("catalog has unexpected data")
> ++	if link == "" {
> ++		t.Fatalf("repositories has less data than expected")
> ++	}
> ++
> ++	// -----------------------------------
> ++	// Case No. 4.1: request n < maxentries (second page)
> ++
> ++	// build pagination link
> ++	values = checkLink(t, link, chunkLen, ctlg.Repositories[len(ctlg.Repositories)-1])
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	expectedRemainder = len(allCatalog) - chunkLen
> ++	if len(ctlg.Repositories) != expectedRemainder {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", expectedRemainder, len(ctlg.Repositories))
> ++	}
> ++
> ++	// -----------------------------------
> ++	// Case No. 5: request n > maxentries | return err: ErrorCodePaginationNumberInvalid
> ++	values = url.Values{
> ++		"n": []string{strconv.Itoa(maxEntries + 10)},
> ++	}
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusBadRequest)
> ++	checkBodyHasErrorCodes(t, "invalid number of results requested", resp, v2.ErrorCodePaginationNumberInvalid)
> ++
> ++	// -----------------------------------
> ++	// Case No. 6: request n > maxentries but <= total catalog | return err: ErrorCodePaginationNumberInvalid
> ++	values = url.Values{
> ++		"n": []string{strconv.Itoa(len(allCatalog))},
> ++	}
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusBadRequest)
> ++	checkBodyHasErrorCodes(t, "invalid number of results requested", resp, v2.ErrorCodePaginationNumberInvalid)
> ++
> ++	// -----------------------------------
> ++	// Case No. 7: n = 0 | n is set to max(0, min(defaultEntries, maxEntries))
> ++	values = url.Values{
> ++		"n": []string{"0"},
> ++	}
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	// it must be empty
> ++	if len(ctlg.Repositories) != 0 {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", 0, len(ctlg.Repositories))
> ++	}
> ++
> ++	// -----------------------------------
> ++	// Case No. 8: n = -1 | n is set to max(0, min(defaultEntries, maxEntries))
> ++	values = url.Values{
> ++		"n": []string{"-1"},
> ++	}
> ++
> ++	catalogURL, err = env.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	// it must match max entries
> ++	if len(ctlg.Repositories) != maxEntries {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", expectedRemainder, len(ctlg.Repositories))
> ++	}
> ++
> ++	// -----------------------------------
> ++	// Case No. 9: n = 5, max = 5, total catalog = 4
> ++	values = url.Values{
> ++		"n": []string{strconv.Itoa(maxEntries)},
> ++	}
> ++
> ++	envWithLessImages := newTestEnv(t, false)
> ++	for _, image := range allCatalog[0:(maxEntries - 1)] {
> ++		createRepository(envWithLessImages, t, image, "sometag")
> ++	}
> ++
> ++	catalogURL, err = envWithLessImages.builder.BuildCatalogURL(values)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error building catalog url: %v", err)
> ++	}
> ++
> ++	resp, err = http.Get(catalogURL)
> ++	if err != nil {
> ++		t.Fatalf("unexpected error issuing request: %v", err)
> ++	}
> ++	defer resp.Body.Close()
> ++
> ++	checkResponse(t, "issuing catalog api check", resp, http.StatusOK)
> ++
> ++	dec = json.NewDecoder(resp.Body)
> ++	if err = dec.Decode(&ctlg); err != nil {
> ++		t.Fatalf("error decoding fetched manifest: %v", err)
> ++	}
> ++
> ++	// it must match max entries
> ++	if len(ctlg.Repositories) != maxEntries-1 {
> ++		t.Fatalf("repositories returned unexpected entries (expected: %d, returned: %d)", maxEntries-1, len(ctlg.Repositories))
> +	}
> + }
> +
> +@@ -207,7 +462,7 @@ func checkLink(t *testing.T, urlStr string, numEntries int, last string) url.Val
> +	urlValues := linkURL.Query()
> +
> +	if urlValues.Get("n") != strconv.Itoa(numEntries) {
> +-		t.Fatalf("Catalog link entry size is incorrect")
> ++		t.Fatalf("Catalog link entry size is incorrect (expected: %v, returned: %v)", urlValues.Get("n"), strconv.Itoa(numEntries))
> +	}
> +
> +	if urlValues.Get("last") != last {
> +@@ -2023,6 +2278,9 @@ func newTestEnvMirror(t *testing.T, deleteEnabled bool) *testEnv {
> +		Proxy: configuration.Proxy{
> +			RemoteURL: "http://example.com",
> +		},
> ++		Catalog: configuration.Catalog{
> ++			MaxEntries: 5,
> ++		},
> +	}
> +	config.Compatibility.Schema1.Enabled = true
> +
> +@@ -2039,6 +2297,9 @@ func newTestEnv(t *testing.T, deleteEnabled bool) *testEnv {
> +				"enabled": false,
> +			}},
> +		},
> ++		Catalog: configuration.Catalog{
> ++			MaxEntries: 5,
> ++		},
> +	}
> +
> +	config.Compatibility.Schema1.Enabled = true
> +@@ -2291,7 +2552,6 @@ func checkResponse(t *testing.T, msg string, resp *http.Response, expectedStatus
> +	if resp.StatusCode != expectedStatus {
> +		t.Logf("unexpected status %s: %v != %v", msg, resp.StatusCode, expectedStatus)
> +		maybeDumpResponse(t, resp)
> +-
> +		t.FailNow()
> +	}
> +
> +diff --git a/registry/handlers/catalog.go b/registry/handlers/catalog.go
> +index eca98468..83ec0a9c 100644
> +--- a/registry/handlers/catalog.go
> ++++ b/registry/handlers/catalog.go
> +@@ -9,11 +9,13 @@ import (
> +	"strconv"
> +
> +	"github.com/docker/distribution/registry/api/errcode"
> ++	v2 "github.com/docker/distribution/registry/api/v2"
> +	"github.com/docker/distribution/registry/storage/driver"
> ++
> +	"github.com/gorilla/handlers"
> + )
> +
> +-const maximumReturnedEntries = 100
> ++const defaultReturnedEntries = 100
> +
> + func catalogDispatcher(ctx *Context, r *http.Request) http.Handler {
> +	catalogHandler := &catalogHandler{
> +@@ -38,29 +40,55 @@ func (ch *catalogHandler) GetCatalog(w http.ResponseWriter, r *http.Request) {
> +
> +	q := r.URL.Query()
> +	lastEntry := q.Get("last")
> +-	maxEntries, err := strconv.Atoi(q.Get("n"))
> +-	if err != nil || maxEntries < 0 {
> +-		maxEntries = maximumReturnedEntries
> ++
> ++	entries := defaultReturnedEntries
> ++	maximumConfiguredEntries := ch.App.Config.Catalog.MaxEntries
> ++
> ++	// parse n, if n unparseable, or negative assign it to defaultReturnedEntries
> ++	if n := q.Get("n"); n != "" {
> ++		parsedMax, err := strconv.Atoi(n)
> ++		if err == nil {
> ++			if parsedMax > maximumConfiguredEntries {
> ++				ch.Errors = append(ch.Errors, v2.ErrorCodePaginationNumberInvalid.WithDetail(map[string]int{"n": parsedMax}))
> ++				return
> ++			} else if parsedMax >= 0 {
> ++				entries = parsedMax
> ++			}
> ++		}
> +	}
> +
> +-	repos := make([]string, maxEntries)
> ++	// then enforce entries to be between 0 & maximumConfiguredEntries
> ++	// max(0, min(entries, maximumConfiguredEntries))
> ++	if entries < 0 || entries > maximumConfiguredEntries {
> ++		entries = maximumConfiguredEntries
> ++	}
> +
> +-	filled, err := ch.App.registry.Repositories(ch.Context, repos, lastEntry)
> +-	_, pathNotFound := err.(driver.PathNotFoundError)
> ++	repos := make([]string, entries)
> ++	filled := 0
> +
> +-	if err == io.EOF || pathNotFound {
> ++	// entries is guaranteed to be >= 0 and < maximumConfiguredEntries
> ++	if entries == 0 {
> +		moreEntries = false
> +-	} else if err != nil {
> +-		ch.Errors = append(ch.Errors, errcode.ErrorCodeUnknown.WithDetail(err))
> +-		return
> ++	} else {
> ++		returnedRepositories, err := ch.App.registry.Repositories(ch.Context, repos, lastEntry)
> ++		if err != nil {
> ++			_, pathNotFound := err.(driver.PathNotFoundError)
> ++			if err != io.EOF && !pathNotFound {
> ++				ch.Errors = append(ch.Errors, errcode.ErrorCodeUnknown.WithDetail(err))
> ++				return
> ++			}
> ++			// err is either io.EOF or not PathNotFoundError
> ++			moreEntries = false
> ++		}
> ++		filled = returnedRepositories
> +	}
> +
> +	w.Header().Set("Content-Type", "application/json; charset=utf-8")
> +
> +	// Add a link header if there are more entries to retrieve
> +	if moreEntries {
> +-		lastEntry = repos[len(repos)-1]
> +-		urlStr, err := createLinkEntry(r.URL.String(), maxEntries, lastEntry)
> ++		lastEntry = repos[filled-1]
> ++		urlStr, err := createLinkEntry(r.URL.String(), entries, lastEntry)
> +		if err != nil {
> +			ch.Errors = append(ch.Errors, errcode.ErrorCodeUnknown.WithDetail(err))
> +			return
> +--
> +2.40.0
> -- 
> 2.40.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8131): https://lists.yoctoproject.org/g/meta-virtualization/message/8131
> Mute This Topic: https://lists.yoctoproject.org/mt/100325361/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


