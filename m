Received: from mail-ej1-f48.google.com (mail-ej1-f48.google.com [209.85.218.48])
 by mx.groups.io with SMTP id smtpd.web11.4325.1623725018774086100
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 14 Jun 2021 19:43:39 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=AmH5/wTg;
 spf=pass (domain: gmail.com, ip: 209.85.218.48, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f48.google.com with SMTP id gt18so1369995ejc.11
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 14 Jun 2021 19:43:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Ys4vhrf5wEHkXNt3f47bvF3/BYAUM+58Q0eJ1tz0ZsQ=;
        b=AmH5/wTgOBCIljV3yCmddL3zI/i0xwYlmE7YkOnXMf4zle+xfwfgEgeK8qIYXkDiOQ
         DKAcR+UacEV3ttqxqyyWnkbBTKjx9LyFuPEe1TklPVV6Kmk9aziSExXm6FtGczakmBlF
         sJb/5j4eUy8kCvXMU3jEWP677KE9g7+vpS4WK8Na6FQARbkEF1kiua4vu1ehqsCiykBL
         f/rb87GG3tubJak09dIzL7fIWKCUWr5aeWKOtijADJ1gF2VKc7tmir7+5naA2EDBpRhh
         nE4ec5V6LDS7nEyiCUfkb0teLUm+eZIdnoNqFdFROvmaowxCN9RWwQd/yJ2QoSsJmVzQ
         ewuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Ys4vhrf5wEHkXNt3f47bvF3/BYAUM+58Q0eJ1tz0ZsQ=;
        b=aOSffgF34wpug5WtYJg/OODDFKUUxZJypSkUErGLbKTt6v9xRgi2NIAvS+wXDQfWK+
         dGAG/Fs5GZ/lf4MXPIBLw0Tpj/FWWcWv9gZaBx63q8xO1wBknkcE5dMp5XEH0X260SMa
         fy6ohH783fkfvwtXUIl2e2W7Ff+St+76mA0124yN7kcd00XNDfONM6HYtdlodng3cTRs
         GbZrH9ugT2vz5/tilgaXBxkpYUkWJeFjxsYKgtRcJr6zlGvgrbea4r6cSN6uUuEgpkpo
         tlFJSWjMlyKOcT4lZfN+clCT0buYdAMUu/nIyDHxQkFf9D/iaqichElb9DXokoM6cyeO
         u2rA==
X-Gm-Message-State: AOAM530iGIEkY5tZ4eKvcpT4qXtsL4STDfS562M6NVgJj/IqZboTTJx3
	DqswmytE16h2zJU82s+ecP1epaBbpLyZTEbiRO0MAMYKrXgLdA==
X-Google-Smtp-Source: ABdhPJy0k5h28kzZk8em+R+f+bCMIDPh5ooam/+7UnyCog7wjnEr9Cs03UWoQvcjwhyDRlVTI5Cct27km0cG7eR8KRs=
X-Received: by 2002:a17:906:c211:: with SMTP id d17mr18409039ejz.247.1623725016696;
 Mon, 14 Jun 2021 19:43:36 -0700 (PDT)
MIME-Version: 1.0
References: <20210317054105.28887-1-Qi.Chen@windriver.com> <CADkTA4PrV4snkCyQ3A9KpJhaQsr-85j3Mt4QqCuO+52fd3MLtA@mail.gmail.com>
 <f6186111-db43-2c48-f0f7-ee71b0a0b5db@windriver.com>
In-Reply-To: <f6186111-db43-2c48-f0f7-ee71b0a0b5db@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 14 Jun 2021 22:43:25 -0400
Message-ID: <CADkTA4OfN1jdwKNio6sKMzVVZ7HN7Xtc3Fy34hTi0ufnfeWawA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH] runc-docker: adjust patch to fit latest version
To: Kai <kai.kang@windriver.com>
Cc: Chen Qi <Qi.Chen@windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Jun 14, 2021 at 9:51 PM Kai <kai.kang@windriver.com> wrote:
>
> On 3/17/21 8:59 PM, Bruce Ashfield wrote:
>
> On Wed, Mar 17, 2021 at 1:41 AM Chen Qi <Qi.Chen@windriver.com> wrote:
>
> Adjust patch to fit the latest version.
>
> This is the wrong fix (and the commit log is wrong).
>
> I unified runc-docker and runc-opencontainers upstream repositories a
> while ago, since there are no longer docker specifics in a runc
> variant.
>
> I will delete the runc-docker recipe soon, but have been waiting on
> that a bit longer.
>
> When I bumped runc last week, I forgot to bump the second variant as
> well. I've now done that, and the patch issues are gone.
>
> Hi Bruce,
>
> It breaks do_patch again. And what is the "second variant" you've mentioned, please?
>

I just pushed the fix.

By "second variant", I just mean the runc-docker.

At one point, it was significant, but it is basically identical to the
runc-opencontainers one at this point, with a couple of extra patches.
There's one shared patch, and I tend to forget to update the
runc-docker when I bump runc-opencontainers.

I'll start the process of dropping runc-docker in the upcoming release.

Bruce

> Regards,
> Kai
>
> Bruce
>
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
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
>
> 
>
>
> --
> Kai Kang
> Wind River Linux



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
