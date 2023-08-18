Return-Path: <vanusuri@mvista.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAE3AC001DE
	for <webhook@archiver.kernel.org>; Fri, 18 Aug 2023 06:38:20 +0000 (UTC)
Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
 by mx.groups.io with SMTP id smtpd.web10.5994.1692340692895307593
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 17 Aug 2023 23:38:13 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@mvista.com header.s=google header.b=ROeFNN1J;
 spf=pass (domain: mvista.com, ip: 209.85.216.46, mailfrom: vanusuri@mvista.com)
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-26d1e5f2c35so440782a91.2
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 17 Aug 2023 23:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=mvista.com; s=google; t=1692340691; x=1692945491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=j6LegAitDVw9pCmwpSn5LbWUS12L6gf7BNnlbQ0405o=;
        b=ROeFNN1JvpwoHeh0i8VKv6lEeRYXxq4TLyVpdbKifFxW5lRHeK3TiVF2YVgg2Jg3QO
         q8aJnHQophuisHNYDVnvhS2jsaU+mzWoWi35xA3x430p1OUa0C/A8qwE6ISdV2LpWdv9
         SAWYOlAryFg+YYDhv/XQdd0795TaADj+GDAT4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1692340691; x=1692945491;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=j6LegAitDVw9pCmwpSn5LbWUS12L6gf7BNnlbQ0405o=;
        b=BF0W2oNS4O7zeQsgYnyBxoaLUEBQRBUoNu2qRylUCiPZrKnuBNq/fxSQVirRHSfpCY
         DhVvYQygp2P0k0u4E7/g+LZqLACqktjB4nlqHbxB8/oYWTm1/4oBYFjheMTkO9rctIXD
         ZXfkugner+VYcWfS/QGulJ1/S6oh0q2sEjykMjNovwBSTlopVKw9rGfIwjfQq+suexKS
         rZ1LN/Wn1lR824khk7QoJCa6iQpzqdiei3NDR0L2aJAcqrzpqPuFvA539rPZhVJMUn11
         LRjuKKluxKQKDaTcF5L9S4krDuXwrR8OeLKQp48xSoCwwETniU9RWeo0SBeFEljuXHnY
         IKBQ==
X-Gm-Message-State: AOJu0Yz6KeuCd/8T7fhgrjqa1B0RR0s2l0opTpzhPosl8g2bjViLOZxy
	gl7DBKOL144s68kBNA0XRB4/upWaqwiUJ+ZBr2w=
X-Google-Smtp-Source: AGHT+IGyHMnvenBtXdDuPPs78OqN1ZT2cu/BHALOogFGLBVN7xRQa6rU73AuF357iFWa35Lr6dfIcA==
X-Received: by 2002:a17:90a:d143:b0:26d:4448:9233 with SMTP id t3-20020a17090ad14300b0026d44489233mr1018106pjw.41.1692340691324;
        Thu, 17 Aug 2023 23:38:11 -0700 (PDT)
Received: from localhost.localdomain ([2405:201:c01c:78b1:f2f5:6203:d03e:6e49])
        by smtp.gmail.com with ESMTPSA id v12-20020a17090a458c00b00265c742a262sm811279pjg.4.2023.08.17.23.38.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 17 Aug 2023 23:38:10 -0700 (PDT)
From: vanusuri@mvista.com
To: meta-virtualization@lists.yoctoproject.org
Cc: Vijay Anusuri <vanusuri@mvista.com>
Subject: [meta-virtualization][dunfell][PATCH] kubernetes: Backport fix for CVE-2020-8564
Date: Fri, 18 Aug 2023 12:07:57 +0530
Message-Id: <20230818063757.406414-1-vanusuri@mvista.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 18 Aug 2023 06:38:20 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8214

From: Vijay Anusuri <vanusuri@mvista.com>

Upstream-commit: https://github.com/kubernetes/kubernetes/commit/11793434dac97a49bfed0150b56ac63e5dc34634

Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
---
 .../kubernetes/kubernetes/CVE-2020-8564.patch | 166 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 167 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch b/recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch
new file mode 100644
index 0000000..9388f18
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2020-8564.patch
@@ -0,0 +1,166 @@
+From b907f9e11892ddab1e71095e3d41bf76e63c3873 Mon Sep 17 00:00:00 2001
+From: Nikolaos Moraitis <nmoraiti@redhat.com>
+Date: Fri, 11 Sep 2020 11:36:27 +0200
+Subject: [PATCH] avoid potential secret leaking while reading .dockercfg
+
+There are a lot of scenarios where an invalid .dockercfg file
+will still contain secrets. This commit removes logging of the
+contents to avoid any potential leaking and manages the actual error
+by printing to the user the actual location of the invalid file.
+
+Signed-off-by: Nikolaos Moraitis <nmoraiti@redhat.com>
+
+Upstream-Status: Backport [https://github.com/kubernetes/kubernetes/commit/11793434dac97a49bfed0150b56ac63e5dc34634]
+CVE: CVE-2020-8564
+Signed-off-by: Vijay Anusuri <vanusuri@mvista.com>
+---
+ pkg/credentialprovider/config.go      | 16 +++--
+ pkg/credentialprovider/config_test.go | 93 +++++++++++++++++++++++++++
+ 2 files changed, 102 insertions(+), 7 deletions(-)
+
+diff --git a/pkg/credentialprovider/config.go b/pkg/credentialprovider/config.go
+index 377383aa903..b256bd8e7f0 100644
+--- a/src/import/pkg/credentialprovider/config.go
++++ b/src/import/pkg/credentialprovider/config.go
+@@ -114,10 +114,14 @@ func ReadDockercfgFile(searchPaths []string) (cfg DockerConfig, err error) {
+ 			continue
+ 		}
+ 		cfg, err := readDockerConfigFileFromBytes(contents)
+-		if err == nil {
+-			klog.V(4).Infof("found .dockercfg at %s", absDockerConfigFileLocation)
+-			return cfg, nil
++		if err != nil {
++			klog.V(4).Infof("couldn't get the config from %q contents: %v", absDockerConfigFileLocation, err)
++			continue
+ 		}
++
++		klog.V(4).Infof("found .dockercfg at %s", absDockerConfigFileLocation)
++		return cfg, nil
++
+ 	}
+ 	return nil, fmt.Errorf("couldn't find valid .dockercfg after checking in %v", searchPaths)
+ }
+@@ -224,8 +228,7 @@ func ReadDockerConfigFileFromUrl(url string, client *http.Client, header *http.H
+ 
+ func readDockerConfigFileFromBytes(contents []byte) (cfg DockerConfig, err error) {
+ 	if err = json.Unmarshal(contents, &cfg); err != nil {
+-		klog.Errorf("while trying to parse blob %q: %v", contents, err)
+-		return nil, err
++		return nil, errors.New("error occurred while trying to unmarshal json")
+ 	}
+ 	return
+ }
+@@ -233,8 +236,7 @@ func readDockerConfigFileFromBytes(contents []byte) (cfg DockerConfig, err error
+ func readDockerConfigJsonFileFromBytes(contents []byte) (cfg DockerConfig, err error) {
+ 	var cfgJson DockerConfigJson
+ 	if err = json.Unmarshal(contents, &cfgJson); err != nil {
+-		klog.Errorf("while trying to parse blob %q: %v", contents, err)
+-		return nil, err
++		return nil, errors.New("error occurred while trying to unmarshal json")
+ 	}
+ 	cfg = cfgJson.Auths
+ 	return
+diff --git a/pkg/credentialprovider/config_test.go b/pkg/credentialprovider/config_test.go
+index c310dc33dce..6974076984f 100644
+--- a/src/import/pkg/credentialprovider/config_test.go
++++ b/src/import/pkg/credentialprovider/config_test.go
+@@ -304,3 +304,96 @@ func TestDockerConfigEntryJSONCompatibleEncode(t *testing.T) {
+ 		}
+ 	}
+ }
++
++func TestReadDockerConfigFileFromBytes(t *testing.T) {
++	testCases := []struct {
++		id               string
++		input            []byte
++		expectedCfg      DockerConfig
++		errorExpected    bool
++		expectedErrorMsg string
++	}{
++		{
++			id:    "valid input, no error expected",
++			input: []byte(`{"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"}}`),
++			expectedCfg: DockerConfig(map[string]DockerConfigEntry{
++				"http://foo.example.com": {
++					Username: "foo",
++					Password: "bar",
++					Email:    "foo@example.com",
++				},
++			}),
++		},
++		{
++			id:               "invalid input, error expected",
++			input:            []byte(`{"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"`),
++			errorExpected:    true,
++			expectedErrorMsg: "error occurred while trying to unmarshal json",
++		},
++	}
++
++	for _, tc := range testCases {
++		cfg, err := readDockerConfigFileFromBytes(tc.input)
++		if err != nil && !tc.errorExpected {
++			t.Fatalf("Error was not expected: %v", err)
++		}
++		if err != nil && tc.errorExpected {
++			if !reflect.DeepEqual(err.Error(), tc.expectedErrorMsg) {
++				t.Fatalf("Expected error message: `%s` got `%s`", tc.expectedErrorMsg, err.Error())
++			}
++		} else {
++			if !reflect.DeepEqual(cfg, tc.expectedCfg) {
++				t.Fatalf("expected: %v got %v", tc.expectedCfg, cfg)
++			}
++		}
++	}
++}
++
++func TestReadDockerConfigJSONFileFromBytes(t *testing.T) {
++	testCases := []struct {
++		id               string
++		input            []byte
++		expectedCfg      DockerConfig
++		errorExpected    bool
++		expectedErrorMsg string
++	}{
++		{
++			id:    "valid input, no error expected",
++			input: []byte(`{"auths": {"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"}, "http://bar.example.com":{"username": "bar", "password": "baz", "email": "bar@example.com"}}}`),
++			expectedCfg: DockerConfig(map[string]DockerConfigEntry{
++				"http://foo.example.com": {
++					Username: "foo",
++					Password: "bar",
++					Email:    "foo@example.com",
++				},
++				"http://bar.example.com": {
++					Username: "bar",
++					Password: "baz",
++					Email:    "bar@example.com",
++				},
++			}),
++		},
++		{
++			id:               "invalid input, error expected",
++			input:            []byte(`{"auths": {"http://foo.example.com":{"username": "foo", "password": "bar", "email": "foo@example.com"}, "http://bar.example.com":{"username": "bar", "password": "baz", "email": "bar@example.com"`),
++			errorExpected:    true,
++			expectedErrorMsg: "error occurred while trying to unmarshal json",
++		},
++	}
++
++	for _, tc := range testCases {
++		cfg, err := readDockerConfigJSONFileFromBytes(tc.input)
++		if err != nil && !tc.errorExpected {
++			t.Fatalf("Error was not expected: %v", err)
++		}
++		if err != nil && tc.errorExpected {
++			if !reflect.DeepEqual(err.Error(), tc.expectedErrorMsg) {
++				t.Fatalf("Expected error message: `%s` got `%s`", tc.expectedErrorMsg, err.Error())
++			}
++		} else {
++			if !reflect.DeepEqual(cfg, tc.expectedCfg) {
++				t.Fatalf("expected: %v got %v", tc.expectedCfg, cfg)
++			}
++		}
++	}
++}
+-- 
+2.25.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index 8c286e2..c73f988 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -11,6 +11,7 @@ SRCREV_kubernetes = "f45fc1861acab22eb6a4697e3fb831e85ef5ff9c"
 SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.17;name=kubernetes;protocol=https \
            file://0001-hack-lib-golang.sh-use-CC-from-environment.patch \
            file://0001-cross-don-t-build-tests-by-default.patch \
+           file://CVE-2020-8564.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.25.1


