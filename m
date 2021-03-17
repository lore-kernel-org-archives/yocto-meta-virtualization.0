Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
 by mx.groups.io with SMTP id smtpd.web09.5685.1615985998830254391
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 17 Mar 2021 05:59:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mlDG7KH4;
 spf=pass (domain: gmail.com, ip: 209.85.208.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f53.google.com with SMTP id dm8so2156934edb.2
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 17 Mar 2021 05:59:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+u5zYA5oUM7JvVM1AZfgD6IB+7f8YoQqg3dGCMYQir0=;
        b=mlDG7KH4/APjMOPjtjqnX9j6DRgNdx/axO4A+FbgrJ/0nw0cMv0XcOeee5oEKRY4Vh
         qFBKs+JYnqlZDZgxXOVXWFr+KGehlZrARyhvVoapHDdzmKdeo0t19fsOpV5UEqem+Ski
         nOGFcwIeEEp+ZvmufwpjbikDMh2dQ5lFLwSmu823lFyWF4YU3zW3SAlzDg0ykAvrMrI8
         rExX3Jz8gqmricvAPjpARFq0/uNrn2oGHeCmR5AyJ6V+innN5onzaMM28XRFs9ctIgp4
         mAaL0G3YJ+6lXegS3F9E6fyL7Fgz5c/mAgOPUc04bOxF1/MJsZ+K4lLzWBzt608i6d67
         Elqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+u5zYA5oUM7JvVM1AZfgD6IB+7f8YoQqg3dGCMYQir0=;
        b=aA6PE/JOOg9u+eKU3CI/NnTsnHTDsc6W0Md8v4AbaVITHmaSw1d9bllD7wEUoFl8RE
         9fpRQAVNp1jrNJEaTOpTaVOAaP4cVjWSfogwX/nz9L84ws7MNYk6fBt1bh3D7G6cLhXl
         dasYFPUrXHeYry6PhqfppjxJB7fkOEAGeVaCz2d1GCsR0tn+lKMQ9Y0D2pK3ydkVZKa6
         y0d0q9WNObQbUQh0gbz/gkTJNxG9Pup7n7PTRTFAc9OvlMzwERGO53tT9IPlO+RBj073
         xTkZhC8/VksH6G8gec2r+HQrJ28FjSsZ5Q/5/yBg8U28vKnXL+Mvc/zrdWRZKz74TXSl
         1u4g==
X-Gm-Message-State: AOAM532MbjlW6JEVos9wlESN3DqIJvj6zZRrA0ACOgAynpKtW9AjskRS
	H5JD5XIntwBWcX0ETkX0oeBfoTO6/2dgVcQYYjQJ01iCkO3htQ==
X-Google-Smtp-Source: ABdhPJxyq18swh7BM3TcbBUQiDez7xrT31AjoJSShWmYIQZaRpLOBLElaYCPQPK2LssBPVuEBqbzs5WFo7YlyL4Jr+E=
X-Received: by 2002:aa7:d54c:: with SMTP id u12mr43337412edr.234.1615985997016;
 Wed, 17 Mar 2021 05:59:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210317054105.28887-1-Qi.Chen@windriver.com>
In-Reply-To: <20210317054105.28887-1-Qi.Chen@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Wed, 17 Mar 2021 08:59:46 -0400
Message-ID: <CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] runc-docker: adjust patch to fit latest version
To: Chen Qi <Qi.Chen@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Wed, Mar 17, 2021 at 1:41 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Adjust patch to fit the latest version.
>

This is the wrong fix (and the commit log is wrong).

I unified runc-docker and runc-opencontainers upstream repositories a
while ago, since there are no longer docker specifics in a runc
variant.

I will delete the runc-docker recipe soon, but have been waiting on
that a bit longer.

When I bumped runc last week, I forgot to bump the second variant as
well. I've now done that, and the patch issues are gone.

Bruce

> Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> ---
>  ...docker-Makefile-respect-GOBUILDFLAGS.patch | 37 +++++++++++++++++++
>  recipes-containers/runc/runc-docker_git.bb    |  2 +-
>  2 files changed, 38 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
>
> diff --git a/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
> new file mode 100644
> index 00000000..7ea9109a
> --- /dev/null
> +++ b/recipes-containers/runc/runc-docker/0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch
> @@ -0,0 +1,37 @@
> +From c8ac2963cf17d4ee45b8b6ccbdfd81fe52e7092a Mon Sep 17 00:00:00 2001
> +From: Chen Qi <Qi.Chen@windriver.com>
> +Date: Tue, 16 Mar 2021 22:27:45 -0700
> +Subject: [PATCH] Makefile: respect GOBUILDFLAGS for runc and remove recvtty
> + from static
> +
> +Upstream-Status: Inappropriate [OE Specific]
> +
> +Signed-off-by: Chen Qi <Qi.Chen@windriver.com>
> +---
> + Makefile | 3 +--
> + 1 file changed, 1 insertion(+), 2 deletions(-)
> +
> +diff --git a/src/import/Makefile b/src/import/Makefile
> +index e13d8f1d..409b61dd 100644
> +--- a/src/import/Makefile
> ++++ b/src/import/Makefile
> +@@ -23,7 +23,7 @@ ifeq ($(shell $(GO) env GOOS),linux)
> +               GO_BUILDMODE := "-buildmode=pie"
> +       endif
> + endif
> +-GO_BUILD := $(GO) build -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
> ++GO_BUILD := $(GO) build $(GOBUILDFLAGS) -trimpath $(MOD_VENDOR) $(GO_BUILDMODE) $(EXTRA_FLAGS) -tags "$(BUILDTAGS)" \
> +       -ldflags "-X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
> + GO_BUILD_STATIC := CGO_ENABLED=1 $(GO) build -trimpath $(MOD_VENDOR) $(EXTRA_FLAGS) -tags "$(BUILDTAGS) netgo osusergo" \
> +       -ldflags "-w -extldflags -static -X main.gitCommit=$(COMMIT) -X main.version=$(VERSION) $(EXTRA_LDFLAGS)"
> +@@ -40,7 +40,6 @@ recvtty:
> +
> + static:
> +       $(GO_BUILD_STATIC) -o runc .
> +-      $(GO_BUILD_STATIC) -o contrib/cmd/recvtty/recvtty ./contrib/cmd/recvtty
> +
> + release:
> +       script/release.sh -r release/$(VERSION) -v $(VERSION)
> +--
> +2.30.2
> +
> diff --git a/recipes-containers/runc/runc-docker_git.bb b/recipes-containers/runc/runc-docker_git.bb
> index 118bfc1d..9e7043ad 100644
> --- a/recipes-containers/runc/runc-docker_git.bb
> +++ b/recipes-containers/runc/runc-docker_git.bb
> @@ -5,7 +5,7 @@ include runc.inc
>  SRCREV_runc-docker = "b4cb54c2ea78b90f9d8284316aeaeff876f61dfc"
>  SRC_URI = "git://github.com/opencontainers/runc;nobranch=1;name=runc-docker \
>             file://0001-runc-Add-console-socket-dev-null.patch \
> -           file://0001-Makefile-respect-GOBUILDFLAGS-for-runc-and-remove-re.patch \
> +           file://0001-runc-docker-Makefile-respect-GOBUILDFLAGS.patch \
>             file://0001-runc-docker-SIGUSR1-daemonize.patch \
>            "
>
> --
> 2.17.1
>
>
> 
>


--
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
