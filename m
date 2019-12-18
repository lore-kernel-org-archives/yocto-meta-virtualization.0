Received: from mail-oi1-f174.google.com (mail-oi1-f174.google.com [209.85.167.174])
 by mx.groups.io with SMTP id smtpd.web10.8462.1576662570886127396
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 18 Dec 2019 01:49:31 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=BCJwROZ4;
 spf=pass (domain: gmail.com, ip: 209.85.167.174, mailfrom: learning.yocto@gmail.com)
Received: by mail-oi1-f174.google.com with SMTP id h19so565855oih.4;
        Wed, 18 Dec 2019 01:49:30 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=nqYg0F5z54+14JVPw3m56nX7xxhSbbyYqilArZEUJQk=;
        b=BCJwROZ47IwRf1RDJqjgkjnqUkF/lpkl5MIt17M6vnBIFweyUhy5zrFIprNf6ISdQD
         GkyG/cUnVtv7SfsUShydodEozAXe0AgCr7kx3xFi6PAiP8wHPhDP4jbjIDGU2Owdl4gd
         9NKclMzz7lzGyCaqalFH5n/7aBDnMxZbqLO9fFurc9hzZ33FJYnglJPVuEZaEaz0Ss/K
         2bU4rowrJdCPPz/2MM0SqgIZKQAZGvL/LZ5MWx6AZ8XurOwec4eGPmV36pZYvx76MYl5
         rXp6EY5yYpGwGhFbbm/WUM5hrGUNsBuuTWwQCqQTEdoDq/ZJcZ6mY3h700sVNwMFbxek
         0s5w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=nqYg0F5z54+14JVPw3m56nX7xxhSbbyYqilArZEUJQk=;
        b=XeyCJWJeDEL7XvWK5AYuwYKUeRiuhoUgeBA5W2VCbF3r3XVVoPzplhvWB8fMj2xxx9
         4h1xs1Bsw+VsHsW4SZBpm1+Hz9TZ1nANikAYXCEBITdZ24g3fEkb130WFlk6KGxjyLTs
         PVZlW9F5BKpdfVP2KZ0JbzLDFtRbYVrfZnOtkwkM/9LRZMMWT8I3b67XvJWQDrHY/6hb
         SDUqcTYZnePw3Tnhb33bTuxtqFq6wdRxm1mfBf5qatU7kiZtmLQId4in3V2+rfBorCg0
         H5GFiLCbB83B3gAHQmeCU52gTlhBwSi5SVKESJGpVWmduL3gypyxv/Q4g+sQ+picG5y4
         kCMg==
X-Gm-Message-State: APjAAAWBm7LJ8qZ0U6vYzZiYaCGQc4kT+7Gpmqc7/XvQyHexG5spBb7f
	fhdy+Tv43rjJ7u6ptP6VqTuHMhkQqDPRVH3h5RXBr6ZNUYrNUw==
X-Google-Smtp-Source: APXvYqxnJ+WKT+oA2pv+OFy4ZQtxVRincAgzL6VQf6lkdKlKgRywqGX0JKenRX3ooYx0v2o4VI2hUomOIqzwoTftY7Q=
X-Received: by 2002:a05:6808:a8a:: with SMTP id q10mr94416oij.66.1576662569348;
 Wed, 18 Dec 2019 01:49:29 -0800 (PST)
MIME-Version: 1.0
References: <15E15F75E87A3A54.14752@lists.yoctoproject.org>
In-Reply-To: <15E15F75E87A3A54.14752@lists.yoctoproject.org>
From: "learning yocto" <learning.yocto@gmail.com>
Date: Wed, 18 Dec 2019 09:49:16 +0000
Message-ID: <CAGWAjas1j+-imALC3Ggc_hLAnd4a8cqPv-kiftfTLObQ3bjZnw@mail.gmail.com>
Subject: Re: [yocto] go tool dist: unknown architecture: aarch64
To: yocto@lists.yoctoproject.org, meta-virtualization@lists.yoctoproject.org
Cc: learning.yocto@gmail.com
Content-Type: text/plain; charset="UTF-8"

A bit debug, found out that the go-native.inc depends on
go1.4-bootstrap which does not have arm64/aarch64 support.
Found out a reference on
- https://golang.org/doc/install/source#bootstrapFromSource
- https://golang.org/doc/install/source#bootstrapFromCrosscompiledSource

To cross-compile a bootstrap toolchain from source, which is necessary
on systems Go 1.4 did not target (for example, linux/ppc64le), install
Go on a different system and run
bootstrap.bash(https://golang.org/src/bootstrap.bash)

When run as (for example)

$ GOOS=linux GOARCH=ppc64 ./bootstrap.bash

How to add this in yocto I am not sure...
any pointers please help

On Wed, 18 Dec 2019 at 05:18, learning yocto via
Lists.Yoctoproject.Org
<learning.yocto=gmail.com@lists.yoctoproject.org> wrote:
>
> Hello List,
>
> I am a newbie to yocto world, trying to build poky (zeus) for
>  qemuarm64 machine on an arm64 board.
>
> When I included meta-virtualization layer and add docker-ce
>
> local.conf
> -----------
> DISTRO_FEATURES_append = " virtualization"
> IMAGE_INSTALL_append = " docker"
> -----------
>
> bitbake core-image-minimal / bitbake -c configure go-native
> throws the error
>
> ---------------
> DEBUG: Executing shell function do_configure
> # Building C bootstrap tool.
> cmd/dist
> go tool dist: unknown architecture: aarch64
> WARNING: exit code 1 from a shell command.
> ERROR: Execution of
> '/mnt1/yocto_kb/build-rpi/tmp/work/aarch64-linux/go-native/1.12.9-r0/temp/run.do_configure.31724'
> failed with exit code 1:
> # Building C bootstrap tool.
> cmd/dist
> go tool dist: unknown architecture: aarch64
> WARNING: exit code 1 from a shell command.
> ---------
>
> Not sure how to fix this error.  Please advice
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
>
> View/Reply Online (#47741): https://lists.yoctoproject.org/g/yocto/message/47741
> Mute This Topic: https://lists.yoctoproject.org/mt/68784558/4043142
> Group Owner: yocto+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/yocto/unsub  [learning.yocto@gmail.com]
> -=-=-=-=-=-=-=-=-=-=-=-
