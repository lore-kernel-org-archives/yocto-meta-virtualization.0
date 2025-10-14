Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B53A5CCD183
	for <webhook@archiver.kernel.org>; Tue, 14 Oct 2025 01:58:35 +0000 (UTC)
Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.web11.5888.1760407105534791787
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 13 Oct 2025 18:58:25 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=BTbE4z3X;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-87a092251eeso75651356d6.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 13 Oct 2025 18:58:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1760407104; x=1761011904; darn=lists.yoctoproject.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=kN5FAq7M3naTQvonJcnh8u0q5gOpHQHFeBIi1hgek6g=;
        b=BTbE4z3XQ3HKxzbHqRWX30qffWwJkxM4I5me4g0l24krIuqI+zUKAFzSpnsQsh5Hx1
         FQa3u21hOtH/JeFrudjCVItsuZomUBAqPUFWDwvBVcWl4/SMKKFWLqdbTEZHcSiTbPAj
         E07InFMaDzZ29KSuMjrpbPZuYQa2KpgPBmN3Ljgu7VO7UGyEku3YoMeAd26fNPWyoSW/
         412J5CiBjDMtIKtqDnP3SiNmt5r4HCddzgbYNuae/LdqPjqCDUBh3u57e3uJRZMSL1Dy
         /W1ZWtA7efq1WXvByD2IMFti4I8FBjJM+j7gcK+FPdBvP5IrYFGtB0sQLjwaCJpZIYiC
         zKnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760407104; x=1761011904;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=kN5FAq7M3naTQvonJcnh8u0q5gOpHQHFeBIi1hgek6g=;
        b=MsQcMuv4K2vXYAiUZVbg6fY5F1l3Z4XpoGGw3lGmBryDIcl07y3jg4dE4Hs4Qwq+hV
         lUCsUMdk9Wy3793oZj8gAvq9Ks5Qk0daFTmqP+4/eRDii+HY1Gc+S2ntmWUX0kpnneNR
         ATCq/yDo2EZNSHjU3Nr8c/gkWj7NeVDIbQwAvQX2uz5yDsPtDahZtEqNc3f4nFLpSC4V
         32GjDv2e1kCkUPgmuQQswjDpmirPEB7YZPvbdU43bHHIt1CY07/l+k0jJ276J7D4Y4Av
         A8I1oTtmKPzw5NHNrU244228cjKZW+T7SYTDFesMt22sun0Ohbqy5wBtvZG2hrkib/wf
         Rc/Q==
X-Gm-Message-State: AOJu0YwDh/sAqxOjHh1CjfMH9pQa5vhyQEZOtQNFOMJD3LuTbCwrovp+
	cJvdAYBWPMjR+lMURgIzcetfzztJ8ch0/90bUEZBPicL+0HR4uBtpdbH
X-Gm-Gg: ASbGncucjzdWdqXN+p00Zam01qUM4e6vshb9ih0EmeQWPDTI4WfTyuXtc6/nIUTGMh1
	C7vlM1+4uaQSXta/JAkWSW3ndEFP6XKYnKYmWVz9sSNK1DS7SoN3Y8RGes48mT6CXKSerSXdt3E
	HepFcab3OylWLGemYuA8ZMAn4xrSBpHcE09si6uNLeR9pAsmrISHB2ter4lWXGIn/eH+uV8Iqu0
	2TXQmhEHq4OkAdoq6642GlH1XT87wUOLv4o8dur0rkdZW+keW00zpzashiG3wHiIh1qfICd5sfh
	EYH0kqvboMuiBReTmlPkOAeqJY5g0CVQ/PvriSUOJNN2VyIAJMV9TCL1tz87KvSQJCv4AeryD7K
	rRmG7u3W3i2cf/NKNT73OmJZQyYuoceutCYcY/2bYsG/xvw1iQQbQE8ZeS1P9f6nKVFcfYsyPQF
	w1F6k2Puxr4LsODTodZDI=
X-Google-Smtp-Source: AGHT+IHN4T4Y08KAEH8a3Dgx2KsQ4y2zNbB5EQyFeamTDFRUPheuKW/f2EGz89QuU0aLG0H6HBQeRQ==
X-Received: by 2002:ad4:5b82:0:b0:7e5:f3a8:cff0 with SMTP id 6a1803df08f44-87b3f179117mr382029026d6.31.1760407104328;
        Mon, 13 Oct 2025 18:58:24 -0700 (PDT)
Received: from gmail.com (pool-174-112-62-108.cpe.net.cable.rogers.com. [174.112.62.108])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-87bc359377asm81902286d6.48.2025.10.13.18.58.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 18:58:23 -0700 (PDT)
Date: Mon, 13 Oct 2025 21:58:22 -0400
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: tgaige.opensource@witekio.com
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization] [kirkstone][PATCH]
 containerd-opencontainers: fix CVE-2024-40635
Message-ID: <aO2uPmlFWj03x9R9@gmail.com>
References: <20251002080507.571150-1-tgaige.opensource@witekio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251002080507.571150-1-tgaige.opensource@witekio.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Oct 2025 01:58:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9416

merged.

Bruce


In message: [meta-virtualization] [kirkstone][PATCH] containerd-opencontainers: fix CVE-2024-40635
on 02/10/2025 Th�o Gaig� via lists.yoctoproject.org wrote:

> From: Theo GAIGE <tgaige.opensource@witekio.com>
> 
> Upstream-Status: Backport from https://github.com/containerd/containerd/commit/9639b9625554183d0c4d8d072dccb84fedd2320f
> 
> Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
> ---
>  .../CVE-2024-40635.patch                      | 180 ++++++++++++++++++
>  .../containerd-opencontainers_git.bb          |   1 +
>  2 files changed, 181 insertions(+)
>  create mode 100644 recipes-containers/containerd/containerd-opencontainers/CVE-2024-40635.patch
> 
> diff --git a/recipes-containers/containerd/containerd-opencontainers/CVE-2024-40635.patch b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-40635.patch
> new file mode 100644
> index 00000000..71a0f8b6
> --- /dev/null
> +++ b/recipes-containers/containerd/containerd-opencontainers/CVE-2024-40635.patch
> @@ -0,0 +1,180 @@
> +From 6727fad7cc608f47304c073d758a04ca516e08fd Mon Sep 17 00:00:00 2001
> +From: Craig Ingram <Cjingram@google.com>
> +Date: Fri, 7 Mar 2025 13:27:58 +0000
> +Subject: [PATCH] validate uid/gid
> +
> +Upstream-Status: Backport [https://github.com/containerd/containerd/commit/9639b9625554183d0c4d8d072dccb84fedd2320f]
> +CVE: CVE-2024-40635
> +
> +Signed-off-by: Theo GAIGE <tgaige.opensource@witekio.com>
> +---
> + oci/spec_opts.go            | 24 ++++++++--
> + oci/spec_opts_linux_test.go | 92 +++++++++++++++++++++++++++++++++++++
> + 2 files changed, 112 insertions(+), 4 deletions(-)
> +
> +diff --git a/oci/spec_opts.go b/oci/spec_opts.go
> +index 3330ad108..1f10b24c6 100644
> +--- a/oci/spec_opts.go
> ++++ b/oci/spec_opts.go
> +@@ -22,6 +22,7 @@ import (
> + 	"encoding/json"
> + 	"errors"
> + 	"fmt"
> ++	"math"
> + 	"os"
> + 	"path/filepath"
> + 	"runtime"
> +@@ -536,6 +537,20 @@ func WithUser(userstr string) SpecOpts {
> + 		defer ensureAdditionalGids(s)
> + 		setProcess(s)
> + 		s.Process.User.AdditionalGids = nil
> ++		// While the Linux kernel allows the max UID to be MaxUint32 - 2,
> ++                // and the OCI Runtime Spec has no definition about the max UID,
> ++                // the runc implementation is known to require the UID to be <= MaxInt32.
> ++                //
> ++                // containerd follows runc's limitation here.
> ++                //
> ++                // In future we may relax this limitation to allow MaxUint32 - 2,
> ++                // or, amend the OCI Runtime Spec to codify the implementation limitation.
> ++		const (
> ++			minUserID  = 0
> ++			maxUserID  = math.MaxInt32
> ++			minGroupID = 0
> ++			maxGroupID = math.MaxInt32
> ++		)
> + 
> + 		// For LCOW it's a bit harder to confirm that the user actually exists on the host as a rootfs isn't
> + 		// mounted on the host and shared into the guest, but rather the rootfs is constructed entirely in the
> +@@ -552,8 +567,8 @@ func WithUser(userstr string) SpecOpts {
> + 		switch len(parts) {
> + 		case 1:
> + 			v, err := strconv.Atoi(parts[0])
> +-			if err != nil {
> +-				// if we cannot parse as a uint they try to see if it is a username
> ++			if err != nil || v < minUserID || v > maxUserID {
> ++				// if we cannot parse as an int32 then try to see if it is a username
> + 				return WithUsername(userstr)(ctx, client, c, s)
> + 			}
> + 			return WithUserID(uint32(v))(ctx, client, c, s)
> +@@ -564,12 +579,13 @@ func WithUser(userstr string) SpecOpts {
> + 			)
> + 			var uid, gid uint32
> + 			v, err := strconv.Atoi(parts[0])
> +-			if err != nil {
> ++			if err != nil || v < minUserID || v > maxUserID {
> + 				username = parts[0]
> + 			} else {
> + 				uid = uint32(v)
> + 			}
> +-			if v, err = strconv.Atoi(parts[1]); err != nil {
> ++			v, err = strconv.Atoi(parts[1])
> ++			if err != nil || v < minGroupID || v > maxGroupID {
> + 				groupname = parts[1]
> + 			} else {
> + 				gid = uint32(v)
> +diff --git a/oci/spec_opts_linux_test.go b/oci/spec_opts_linux_test.go
> +index 904edcb42..f3be5ef27 100644
> +--- a/oci/spec_opts_linux_test.go
> ++++ b/oci/spec_opts_linux_test.go
> +@@ -31,6 +31,98 @@ import (
> + 	"golang.org/x/sys/unix"
> + )
> + 
> ++// nolint:gosec
> ++func TestWithUser(t *testing.T) {
> ++	t.Parallel()
> ++
> ++	expectedPasswd := `root:x:0:0:root:/root:/bin/ash
> ++guest:x:405:100:guest:/dev/null:/sbin/nologin
> ++`
> ++	expectedGroup := `root:x:0:root
> ++bin:x:1:root,bin,daemon
> ++daemon:x:2:root,bin,daemon
> ++sys:x:3:root,bin,adm
> ++guest:x:100:guest
> ++`
> ++	td := t.TempDir()
> ++	apply := fstest.Apply(
> ++		fstest.CreateDir("/etc", 0777),
> ++		fstest.CreateFile("/etc/passwd", []byte(expectedPasswd), 0777),
> ++		fstest.CreateFile("/etc/group", []byte(expectedGroup), 0777),
> ++	)
> ++	if err := apply.Apply(td); err != nil {
> ++		t.Fatalf("failed to apply: %v", err)
> ++	}
> ++	c := containers.Container{ID: t.Name()}
> ++	testCases := []struct {
> ++		user        string
> ++		expectedUID uint32
> ++		expectedGID uint32
> ++		err         string
> ++	}{
> ++		{
> ++			user:        "0",
> ++			expectedUID: 0,
> ++			expectedGID: 0,
> ++		},
> ++		{
> ++			user:        "root:root",
> ++			expectedUID: 0,
> ++			expectedGID: 0,
> ++		},
> ++		{
> ++			user:        "guest",
> ++			expectedUID: 405,
> ++			expectedGID: 100,
> ++		},
> ++		{
> ++			user:        "guest:guest",
> ++			expectedUID: 405,
> ++			expectedGID: 100,
> ++		},
> ++		{
> ++			user: "guest:nobody",
> ++			err:  "no groups found",
> ++		},
> ++		{
> ++			user:        "405:100",
> ++			expectedUID: 405,
> ++			expectedGID: 100,
> ++		},
> ++		{
> ++			user: "405:2147483648",
> ++			err:  "no groups found",
> ++		},
> ++		{
> ++			user: "-1000",
> ++			err:  "no users found",
> ++		},
> ++		{
> ++			user: "2147483648",
> ++			err:  "no users found",
> ++		},
> ++	}
> ++	for _, testCase := range testCases {
> ++		testCase := testCase
> ++		t.Run(testCase.user, func(t *testing.T) {
> ++			t.Parallel()
> ++			s := Spec{
> ++				Version: specs.Version,
> ++				Root: &specs.Root{
> ++					Path: td,
> ++				},
> ++				Linux: &specs.Linux{},
> ++			}
> ++			err := WithUser(testCase.user)(context.Background(), nil, &c, &s)
> ++			if err != nil {
> ++				assert.EqualError(t, err, testCase.err)
> ++			}
> ++			assert.Equal(t, testCase.expectedUID, s.Process.User.UID)
> ++			assert.Equal(t, testCase.expectedGID, s.Process.User.GID)
> ++		})
> ++	}
> ++}
> ++
> + // nolint:gosec
> + func TestWithUserID(t *testing.T) {
> + 	t.Parallel()
> +-- 
> +2.43.0
> +
> diff --git a/recipes-containers/containerd/containerd-opencontainers_git.bb b/recipes-containers/containerd/containerd-opencontainers_git.bb
> index 6c0266ac..dd621705 100644
> --- a/recipes-containers/containerd/containerd-opencontainers_git.bb
> +++ b/recipes-containers/containerd/containerd-opencontainers_git.bb
> @@ -9,6 +9,7 @@ SRCREV = "1e1ea6e986c6c86565bc33d52e34b81b3e2bc71f"
>  SRC_URI = "git://github.com/containerd/containerd;branch=release/1.6;protocol=https;destsuffix=git/src/github.com/containerd/containerd \
>             file://0001-Makefile-allow-GO_BUILD_FLAGS-to-be-externally-speci.patch \
>             file://0001-build-don-t-use-gcflags-to-define-trimpath.patch \
> +           file://CVE-2024-40635.patch \
>            "
>  
>  # Apache-2.0 for containerd
> -- 
> 2.43.0
> 

> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#9410): https://lists.yoctoproject.org/g/meta-virtualization/message/9410
> Mute This Topic: https://lists.yoctoproject.org/mt/115548744/1050810
> Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [bruce.ashfield@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


