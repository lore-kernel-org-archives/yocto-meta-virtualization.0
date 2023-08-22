Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CCEB6EE4996
	for <webhook@archiver.kernel.org>; Tue, 22 Aug 2023 03:44:45 +0000 (UTC)
Received: from mail-qt1-f181.google.com (mail-qt1-f181.google.com [209.85.160.181])
 by mx.groups.io with SMTP id smtpd.web11.951.1692675885089379353
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 21 Aug 2023 20:44:45 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20221208 header.b=YRQ0cqVi;
 spf=pass (domain: gmail.com, ip: 209.85.160.181, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qt1-f181.google.com with SMTP id d75a77b69052e-403e7472b28so26090651cf.2
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 21 Aug 2023 20:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1692675884; x=1693280684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=9YoKYVCKzpuKqaCjK6k+HBZFzLbBWX9WPjPiid5ql7U=;
        b=YRQ0cqViQlOJsd9uU4tlquK/6iQwoEPuMAF0QG5TSnFjMN65Qkyd3VutK6cBuLNafp
         rGmDhsW8edccInw3Wz3mdrw4rc2z+qZ7lZMXim+1FL7oyQn68tThxzuzERKSRxMrMOkQ
         BfDyvw+gUuoP0WAt2ehqkvmv6yeVJ8ScH2bEPtz4oFadcfQjPCCQHgXUtGa3KtY5owBO
         7ldTMG7h/2z4uzi0ZGDNaG2RpWWnR4w4Cg6pfsYsSyFyMDT0C7yHe9BD6ySkcVivwdP5
         utk4u7y2T8nnXm/AkfzMNm61OOwsyWO6Y+DAsHZVzMPzxvAJf6TqOcR6Pouk7jUWDCr9
         Ol4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692675884; x=1693280684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9YoKYVCKzpuKqaCjK6k+HBZFzLbBWX9WPjPiid5ql7U=;
        b=GnLHyfWchPhTEcVJiXbQFSs6HIyO94+iYiImjQ0VsjOtyfgBBh2GV6LSp8a9eT8D3u
         skEDYV021XAXQanvqmiPhpY1NL71kzlZkb0NYaMhpxm9irF53L85iEX7mz1C0zJ+PNLj
         kqV+k4wnk3Fr1/UF/q5ij29EbFjndL5qq1Lw4lEfpjgiy2fxT65ITh5ox1QHjMWYfRq1
         W/lO4tbG8mFjgFM2MbnILEODslaAKolf308zSn0u8W6BcPjSCOkWnbejMdzOTmZkBRQb
         ipnp607StD/hZXprnzAYsxQyaJPj6SehSpcK5GBulWyyu3j3mdZXW2GzQC7PnL28z32V
         ap/w==
X-Gm-Message-State: AOJu0YyIjC2MQb8z47yPv1b0Vjdqp0MJSxqSphbU3uXgs7Dq6R9yMpWb
	sKEn2qpkHk0FaCqtfaCdHEBvthZQ9rga7g==
X-Google-Smtp-Source: AGHT+IGdK6PS6pMvI0THzCQOk8c+gOuyyRDQxU8vx2WUi5s5eQPlVdfFyWBzITGvVNJ2REj4qHIBWA==
X-Received: by 2002:a05:622a:4a:b0:405:49c6:4102 with SMTP id y10-20020a05622a004a00b0040549c64102mr10877926qtw.36.1692675884110;
        Mon, 21 Aug 2023 20:44:44 -0700 (PDT)
Received: from gmail.com ([174.112.183.231])
        by smtp.gmail.com with ESMTPSA id h10-20020ac85e0a000000b004054b435f8csm2741047qtx.65.2023.08.21.20.44.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 21 Aug 2023 20:44:43 -0700 (PDT)
Date: Tue, 22 Aug 2023 03:44:42 +0000
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Vijay Anusuri <vanusuri@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix
 for CVE-2020-8564
Message-ID: <ZOQvKvnpIvi9xWnn@gmail.com>
References: <20230818063757.406414-1-vanusuri@mvista.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230818063757.406414-1-vanusuri@mvista.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 22 Aug 2023 03:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8215

merged.

Bruce

In message: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix for CVE-2020-8564
on 18/08/2023 Vijay Anusuri wrote:

> From: Vijay Anusuri <vanusuri@mvista.com>
> 
> Upstream-commit: https://github.com/kubernetes/kubernetes/commit/11793434dac97a49bfed0150b56ac63e5dc34634
> 
> Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> ---
>  .../kubernetes/kubernetes/CVE-2020-8564.patch | 166 ++++++++++++++++++
>  .../kubernetes/kubernetes_git.bb              |   1 +
>  2 files changed, 167 insertions(+)
>  create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch
> 
> diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch
> new file mode 100644
> index 0000000..9388f18
> --- /dev/null
> +++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch
> @@ -0,0 +1,166 @@
> +From b907f9e11892ddab1e71095e3d41bf76e63c3873 Mon Sep 17 00:00:00 2001
> +From: Nikolaos Moraitis <nmoraiti@redhat.com>
> +Date: Fri, 11 Sep 2020 11:36:27 +0200
> +Subject: [PATCH] avoid potential secret leaking while reading .dockercfg
> +
> +There are a lot of scenarios where an invalid .dockercfg file
> +will still contain secrets. This commit removes logging of the
> +contents to avoid any potential leaking and manages the actual error
> +by printing to the user the actual location of the invalid file.
> +
> +Signed-off-by: Nikolaos Moraitis <nmoraiti@redhat.com>
> +
> +Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/11793434dac97a49bfed0150b56ac63e5dc34634]
> +CVE: CVE-2020-8564
> +Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
> +---
> + pkg/credentialprovider/config.go      | 16 +++--
> + pkg/credentialprovider/config_test.go | 93 +++++++++++++++++++++++++++
> + 2 files changed, 102 insertions(+), 7 deletions(-)
> +
> +diff --git a/pkg/credentialprovider/config.go b/pkg/credentialprovider/config.go
> +index 377383aa903..b256bd8e7f0 100644
> +--- a/src/import/pkg/credentialprovider/config.go
> ++++ b/src/import/pkg/credentialprovider/config.go
> +@@ -114,10 +114,14 @@ func ReadDockercfgFile(searchPaths []string) (cfg DockerConfig, err error) {
> + 			continue
> + 		}
> + 		cfg, err := readDockerConfigFileFromBytes(contents)
> +-		if err == nil {
> +-			klog.V(4).Infof("found .dockercfg at %s", absDockerConfigFileLocation)
> +-			return cfg, nil
> ++		if err != nil {
> ++			klog.V(4).Infof("couldn't get the config from %q contents: %v", absDockerConfigFileLocation, err)
> ++			continue
> + 		}
> ++
> ++		klog.V(4).Infof("found .dockercfg at %s", absDockerConfigFileLocation)
> ++		return cfg, nil
> ++
> + 	}
> + 	return nil, fmt.Errorf("couldn't find valid .dockercfg after checking in %v", searchPaths)
> + }
> +@@ -224,8 +228,7 @@ func ReadDockerConfigFileFromUrl(url string, client *http.Client, header *http.H
> + 
> + func readDockerConfigFileFromBytes(contents []byte) (cfg DockerConfig, err error) {
> + 	if err = json.Unmarshal(contents, &cfg); err != nil {
> +-		klog.Errorf("while trying to parse blob %q: %v", contents, err)
> +-		return nil, err
> ++		return nil, errors.New("error occurred while trying to unmarshal json")
> + 	}
> + 	return
> + }
> +@@ -233,8 +236,7 @@ func readDockerConfigFileFromBytes(contents []byte) (cfg DockerConfig, err error
> + func readDockerConfigJsonFileFromBytes(contents []byte) (cfg DockerConfig, err error) {
> + 	var cfgJson DockerConfigJson
> + 	if err = json.Unmarshal(contents, &cfgJson); err != nil {
> +-		klog.Errorf("while trying to parse blob %q: %v", contents, err)
> +-		return nil, err
> ++		return nil, errors.New("error occurred while trying to unmarshal json")
> + 	}
> + 	cfg = cfgJson.Auths
> + 	return
> +diff --git a/pkg/credentialprovider/config_test.go b/pkg/credentialprovider/config_test.go
> +index c310dc33dce..6974076984f 100644
> +--- a/src/import/pkg/credentialprovider/config_test.go
> ++++ b/src/import/pkg/credentialprovider/config_test.go
> +@@ -304,3 +304,96 @@ func TestDockerConfigEntryJSONCompatibleEncode(t *testing.T) {
> + 		}
> + 	}
> + }
> ++
> ++func TestReadDockerConfigFileFromBytes(t *testing.T) {
> ++	testCases := []struct {
> ++		id               string
> ++		input            []byte
> ++		expectedCfg      DockerConfig
> ++		errorExpected    bool
> ++		expectedErrorMsg string
> ++	}{
> ++		{
> ++			id:    "valid input, no error expected",
> ++			input: []byte(`{"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"}}`),
> ++			expectedCfg: DockerConfig(map[string]DockerConfigEntry{
> ++				"http://foo.example.com": {
> ++					Username: "foo",
> ++					Password: "bar",
> ++					Email:    "foo@example.com",
> ++				},
> ++			}),
> ++		},
> ++		{
> ++			id:               "invalid input, error expected",
> ++			input:            []byte(`{"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"`),
> ++			errorExpected:    true,
> ++			expectedErrorMsg: "error occurred while trying to unmarshal json",
> ++		},
> ++	}
> ++
> ++	for _, tc := range testCases {
> ++		cfg, err := readDockerConfigFileFromBytes(tc.input)
> ++		if err != nil && !tc.errorExpected {
> ++			t.Fatalf("Error was not expected: %v", err)
> ++		}
> ++		if err != nil && tc.errorExpected {
> ++			if !reflect.DeepEqual(err.Error(), tc.expectedErrorMsg) {
> ++				t.Fatalf("Expected error message: `%s` got `%s`", tc.expectedErrorMsg, err.Error())
> ++			}
> ++		} else {
> ++			if !reflect.DeepEqual(cfg, tc.expectedCfg) {
> ++				t.Fatalf("expected: %v got %v", tc.expectedCfg, cfg)
> ++			}
> ++		}
> ++	}
> ++}
> ++
> ++func TestReadDockerConfigJSONFileFromBytes(t *testing.T) {
> ++	testCases := []struct {
> ++		id               string
> ++		input            []byte
> ++		expectedCfg      DockerConfig
> ++		errorExpected    bool
> ++		expectedErrorMsg string
> ++	}{
> ++		{
> ++			id:    "valid input, no error expected",
> ++			input: []byte(`{"auths": {"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"}, "http://bar.example.com":{"username": "bar", "password": "baz", "email": "bar@example.com"}}}`),
> ++			expectedCfg: DockerConfig(map[string]DockerConfigEntry{
> ++				"http://foo.example.com": {
> ++					Username: "foo",
> ++					Password: "bar",
> ++					Email:    "foo@example.com",
> ++				},
> ++				"http://bar.example.com": {
> ++					Username: "bar",
> ++					Password: "baz",
> ++					Email:    "bar@example.com",
> ++				},
> ++			}),
> ++		},
> ++		{
> ++			id:               "invalid input, error expected",
> ++			input:            []byte(`{"auths": {"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"}, "http://bar.example.com":{"username": "bar", "password": "baz", "email": "bar@example.com"`),
> ++			errorExpected:    true,
> ++			expectedErrorMsg: "error occurred while trying to unmarshal json",
> ++		},
> ++	}
> ++
> ++	for _, tc := range testCases {
> ++		cfg, err := readDockerConfigJSONFileFromBytes(tc.input)
> ++		if err != nil && !tc.errorExpected {
> ++			t.Fatalf("Error was not expected: %v", err)
> ++		}
> ++		if err != nil && tc.errorExpected {
> ++			if !reflect.DeepEqual(err.Error(), tc.expectedErrorMsg) {
> ++				t.Fatalf("Expected error message: `%s` got `%s`", tc.expectedErrorMsg, err.Error())
> ++			}
> ++		} else {
> ++			if !reflect.DeepEqual(cfg, tc.expectedCfg) {
> ++				t.Fatalf("expected: %v got %v", tc.expectedCfg, cfg)
> ++			}
> ++		}
> ++	}
> ++}
> +-- 
> +2.25.1
> +
> diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
> index 8c286e2..c73f988 100644
> --- a/recipes-containers/kubernetes/kubernetes_git.bb
> +++ b/recipes-containers/kubernetes/kubernetes_git.bb
> @@ -11,6 +11,7 @@ SRCREV_kubernetes = "f45fc1861acab22eb6a4697e3fb831e85ef5ff9c"
>  SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=kubernetes;protocol=https \
>             file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
>             file://0001-cross-don-t-build-tests-by-default.patch \
> +           file://CVE-2020-8564.patch \
>            "
>  
>  DEPENDS += "rsync-native \
> -- 
> 2.25.1
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#8214): https://lists.yoctoproject.org/g/meta-virtualization/message/8214
> Mute This Topic: https://lists.yoctoproject.org/mt/100815936/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


