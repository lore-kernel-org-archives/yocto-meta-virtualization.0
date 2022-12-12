Return-Path: <adrian.freihofer@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9D691C10F31
	for <webhook@archiver.kernel.org>; Mon, 12 Dec 2022 07:59:48 +0000 (UTC)
Received: from mail-ej1-f52.google.com (mail-ej1-f52.google.com [209.85.218.52])
 by mx.groups.io with SMTP id smtpd.web10.37926.1670831979294683412
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 11 Dec 2022 23:59:39 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=mnJsZ08U;
 spf=pass (domain: gmail.com, ip: 209.85.218.52, mailfrom: adrian.freihofer@gmail.com)
Received: by mail-ej1-f52.google.com with SMTP id tz12so3149564ejc.9
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 11 Dec 2022 23:59:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=wJ2ZO6iBIpgdlantUz0pRWpGi3Y+nePJCECDhReEfxE=;
        b=mnJsZ08UdBVbuyO6ry6/mQEeVRMrE32b+Wh2oli1XKCFOWGRt9zl0UJ8e646Wxsde4
         u00RRqM4Wqf4/+tfGwMpwpF5wXBhlGe6COOUVvzf5LMdJ43Cikt84h29rc19YJ+i5g9a
         r1n7cUIcubi1M9rCQlZK3yNn/0O0pznW648LYMFvcB0HBPcpFJBK7R+NcGshzd/UUwv3
         UWNK7w9rbfrgUMc6pL5+zrSLfB4cpZI/SXHGXK0XUa7j4Dqu6iqfq+v3f+dWTyNjk17P
         AOnt7bFYFaQi0IrDwevMak2i8d/J5uYprlUbOqjQaUDrANM7mT+YF3pHufRk63y9lRlz
         GE9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=wJ2ZO6iBIpgdlantUz0pRWpGi3Y+nePJCECDhReEfxE=;
        b=Tt8BGdorF//0PkBvhPHyUQAXHWPBP7Fwxs2Ufa3YSIP3CpJRvy1ooETfLLT520LakP
         QPLvG6S9bu6prVDxZxPNVFmNzsvdep8R+/pLh1mAGTkdQkBPKMStdXq0kjoaW9MvDRIO
         Tzu3t+4x4CEBTsIP3/qhLhST7WVY4ZqYGgU5xcBvBnW8Srd2ygu8LPNSTDpWMxP92biF
         1L3O/pC4UiHY3HnKRXOAqXnBQ+tt7YZLGGFxeeVLQQT8UH4/md4pRBK2xGHsDQYG3J/j
         diNRbbWS9R5z0mVDZB2kjxjqWN3QhI88u1UqyYidhsr1Ri+IyYHLmCL9jADXgWbWKzTS
         +5ig==
X-Gm-Message-State: ANoB5pknPfbjxbSIggxjpcHF4QcbjBM00ZcegfMcJWiGROPnNTCmGag6
	n2jkbO1bjtXYK/F8FB5C9DcKzLhbPO8=
X-Google-Smtp-Source: AA0mqf5I/drifNBc1MgfKQz1kQ0GuQFnGnO2LQ0LvHsOQiBg1YJeTGoAjAVcy95SCST46dGkiDD1LQ==
X-Received: by 2002:a17:906:4c95:b0:7c0:cc81:3d94 with SMTP id q21-20020a1709064c9500b007c0cc813d94mr14439720eju.13.1670831977181;
        Sun, 11 Dec 2022 23:59:37 -0800 (PST)
Received: from md2ramxc.ad001.siemens.net ([62.32.0.33])
        by smtp.gmail.com with ESMTPSA id ko5-20020a170907986500b007bd1ef2cccasm2952278ejc.48.2022.12.11.23.59.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Dec 2022 23:59:36 -0800 (PST)
From: Adrian Freihofer <adrian.freihofer@gmail.com>
X-Google-Original-From: Adrian Freihofer <adrian.freihofer@siemens.com>
To: meta-virtualization@lists.yoctoproject.org
Cc: Adrian Freihofer <adrian.freihofer@siemens.com>
Subject: [meta-virtualization][kirkstone][PATCHv2 00/21] docker updates
Date: Mon, 12 Dec 2022 08:58:36 +0100
Message-Id: <20221212075857.1065221-1-adrian.freihofer@siemens.com>
X-Mailer: git-send-email 2.38.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 12 Dec 2022 07:59:48 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7753

This brings docker-ce, docker-moby, containerd-opencontainers,
runc-opencontainers and runc-docker to almost the same commits
as they are on the master branch. That's what I did:

  git cherry-pick ea4c3c3ebac169c3b609476de1cae9bf826e2e50
  git cherry-pick ade7848788f9b9b1fdf64c2569601ae187e92b1c
  git cherry-pick 3cf7b710863cbc0d2696700c3eb30f9ee6638953
  git cherry-pick 3012689f5eb352ac6d35f64cf30fee26e947c980
  git revert 16e29a7818e2e342960e8ccb38768543f860021c
    commit e4474ef881401b2f3ed3ba806a288bb986dcac49 of runc does a vendor
    update which includes the reverted fix again. The commit is after
    1.2.0 and before 1.3.0 --> the next cherry-pick updates runc to
    1.3.0 and the fix will be back.
  git cherry-pick d8ecc12a13ec4da705f4f2597582879ef7889833
  git cherry-pick 038b48664af66ad4ae1f02e23a2b3fce7f93db6d
  git cherry-pick dbe9ce60c2628a3b63067e0334491448c8643a0a
  git cherry-pick bd60f149dceb0a96ce6c2593103738aa8dccfb5a
  git cherry-pick f6bf30aca6cb16f4fe185965f56e4e59dd7848f8
  git cherry-pick 19045acf78b48d7c0d08e7d6afe55133fbf544be
  git cherry-pick 9ef3fa52d049d5c9ffebcbcbd9d2dd7598fd6685
  git cherry-pick 7cea149bb0b510d2fb7fe71eee28d10399d0ceb4
  git cherry-pick a61f6ea090891356bdddd3b63fa2fee228fd38af
  git cherry-pick 2d0f7255a75d24ec3e3b686d70e97d20dc39c259

  git cherry-pick 6dba10357ce8906c95b81d3256e945c617999aa8
  git cherry-pick 99e93d3f88ba1ba21c4d9bec01b07a6d68d7e0b2
  git cherry-pick 6499f37793e691e0ee07e8f7e5dea4960c8c2217
  git cherry-pick 9d84fcdc6dd6e6f76709e697e37ee352b8a7de6e
  git cherry-pick 3f45dc8e6944da89c3124871debec9ec5f443bd5
  git cherry-pick d3acb1a378e644fe2784a8357390b19695640f78

  Finally the update of moby/ce to v20.10.21 is not straight forward.
  - moby: There is an update to go 1.8 which needs to be reverted.
    The commits are not exactly the same as referred by master. That's
    on purpose. Picking more commits would just add more code which needs
    go 1.8.
  - For the cli the update to go 1.8 chagned only the docker build files
    but not the code or the vendor folder. It's still straight forward.
  - libnetwork does not have such changes. It's still straight forward.

Testing:

# docker run -it debian /bin/bash
  root@e44d34c90b37:/# cat /etc/os-release
  PRETTY_NAME="Debian GNU/Linux 11 (bullseye)"
  NAME="Debian GNU/Linux"
  VERSION_ID="11"
  VERSION="11 (bullseye)"
  VERSION_CODENAME=bullseye
  ID=debian
  HOME_URL="https://www.debian.org/"
  SUPPORT_URL="https://www.debian.org/support"
  BUG_REPORT_URL="https://bugs.debian.org/"
  root@e44d34c90b37:/# exit
exit
# docker version
Client:
 Version:           20.10.21-ce
 API version:       1.41
 Go version:        go1.17.13
 Git commit:        baeda1f82a
 Built:             Fri Dec  9 07:20:51 2022
 OS/Arch:           linux/arm64
 Context:           default
 Experimental:      true

Server:
 Engine:
  Version:          20.10.21-ce
  API version:      1.41 (minimum version 1.12)
  Go version:       go1.17.13
  Git commit:       3056208812eb5e792fa99736c9167d1e10f4ab49
  Built:            Tue Oct 25 11:44:15 2022
  OS/Arch:          linux/arm64
  Experimental:     false
 containerd:
  Version:          v1.6.9-12-g6c41694da.m
  GitCommit:        6c41694da9eb09c2f1f49a5a5fbec4e970cfb460.m
 runc:
  Version:          1.1.4+dev
  GitCommit:        v1.1.4-8-g974efd2d-dirty
 docker-init:
  Version:          0.19.0
  GitCommit:        b9f42a0-dirty


Adrian Freihofer (2):
  runc-opencontainers: drop obsolete patch
  moby: update to v20.10.21

Bruce Ashfield (18):
  docker/moby: update to 20.10.16
  docker/moby/libnetwork: update to -latest
  docker-ce: update to 20.10.16
  runc: update to 1.1.3
  runc-docker: update to 1.1.3
  docker-moby: update to 20.10.17
  docker-ce: update to 20.10.17
  docker: ensure that sysvinit and systemd are exclusive
  containerd: update to 1.6.8
  containerd: improve reproducibility
  docker: reproducibility add -trimpath to go -> $GO patches
  containerd: fix final TMDIR references
  runc: update to 1.1.4-tip
  runc-docker: update to 1.1.4-tip
  containerd: update to v1.6.9
  docker: add mobyproject:moby to CVE_PRODUCT
  docker: add seccomp to default packageconfig settings
  docker/moby: use generic DOCKER_COMMIT in do_compile

Jose Quaresma (1):
  docker/proxy: don't use -linkshared unconditionally

 .../0001-Add-build-option-GODEBUG-1.patch     |   32 -
 ...O_BUILD_FLAGS-to-be-externally-speci.patch |    6 +-
 ...don-t-use-gcflags-to-define-trimpath.patch |   30 +
 .../containerd-opencontainers_git.bb          |   62 +-
 ...1-build-use-oe-provided-GO-and-flags.patch |    6 +-
 recipes-containers/docker/README              |    7 +
 recipes-containers/docker/docker-ce_git.bb    |   13 +-
 recipes-containers/docker/docker-moby_git.bb  |   13 +-
 recipes-containers/docker/docker.inc          |   18 +-
 ...ernal-GO111MODULE-and-cross-compiler.patch |   15 +-
 ...0001-dynbinary-use-go-cross-compiler.patch |    2 +-
 ...0001-libnetwork-use-GO-instead-of-go.patch |   10 +-
 .../files/0001-revert-go-1.8-update.patch     | 1218 +++++++++++++++++
 ...efine-ActKillThread-equal-to-ActKill.patch |   90 --
 recipes-containers/runc/runc-docker_git.bb    |    4 +-
 .../runc/runc-opencontainers_git.bb           |    5 +-
 16 files changed, 1322 insertions(+), 209 deletions(-)
 delete mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-Add-build-option-GODEBUG-1.patch
 create mode 100644 recipes-containers/containerd/containerd-opencontainers/0001-build-don-t-use-gcflags-to-define-trimpath.patch
 create mode 100644 recipes-containers/docker/README
 create mode 100644 recipes-containers/docker/files/0001-revert-go-1.8-update.patch
 delete mode 100644 recipes-containers/runc/files/0002-Define-ActKillThread-equal-to-ActKill.patch

-- 
2.38.1


