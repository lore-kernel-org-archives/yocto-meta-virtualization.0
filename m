Received: from mail-qv1-f43.google.com (mail-qv1-f43.google.com [209.85.219.43])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.21255.1794802189631705788
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 15 Nov 2026 20:09:49 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20260707 header.b=HfKEfxwJ;
 spf=pass (domain: gmail.com, ip: 209.85.219.43, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-qv1-f43.google.com with SMTP id 6a1803df08f44-91ecdaf14beso39978026d6.3
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 15 Nov 2026 20:09:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794802188; x=1795406988; darn=lists.yoctoproject.org;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=f1U36WG9Uq5w6TwLuewSBrsHV5dzqUCaqi3DiF2UDD4=;
        b=HfKEfxwJOFCH66AwiIPjaUoQ4bFwnEvN0meBbNhEBM3teChLlaZXyJQ3kVWw5cBKGO
         O+nf/5m8tCp3kuKhvqeB8Cpb+KP8rzSiMLm0sinVDeF7yUWAFTLKPGwAPGKoanDutxzF
         9Id5+5Q1+wyoWcrKPZj9aBssSG6KO/lXs+U7UG+YREwXwqmQkV02FmzOCjCWrNVNHO7o
         ci6i+TKAqt5MeB0LK+Nr0rKs92qZ7k69CODkFwn71aWnGxHj4CrVI+4QQNojm/9aB8Kg
         W4bdwQF4dy5+9zJS8YHp22iykk4AVh7GfYysn8sbYH6IX4TKp7L09f+s26bOHdr9BH9V
         pZfQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794802188; x=1795406988;
        h=mime-version:content-transfer-encoding:content-type:references
         :in-reply-to:subject:cc:to:from:date:message-id:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=f1U36WG9Uq5w6TwLuewSBrsHV5dzqUCaqi3DiF2UDD4=;
        b=Iuw4Iz1H92kiurz493ru5PfjPBPyfuyxrf29C1lxB44WDK70zniAihAjEvGbeFsi3g
         l7Z4AFsRfa/FSQtm7hnyaE131b/aXYWzjhws8K+2LqtYeNPD9iHR6/+Cijpym/RmBgld
         nK6gu1CilhLOPmUWzoCXb+yWjSsiLw6aBYCrJtyJW/fU0uCTvbu/onnp4lRnOyvx+77s
         H2/JkEx1hh66BMRRaAipiQubGKAsLmfJgMr0Z3xktSTjbruBJzQ1gsL7hsVmtE4pLojN
         wts2dkwGGqlm58wGjXgEoEK3M9YSj6WMKTHfpT6rIymh/xFiIjCOGW6aQ5O4CcSjHB8E
         pHQw==
X-Gm-Message-State: APuU4Z+eRzb3ufPFK8mMzrQoKKwjujn8VHuXnhYdbW2VoU+xQNmVyuUy
	hGn2bh3xGzG2ZzhgZcIXzQ1Su7ujq5V/ssa6Kvx2jXVDBpqVAVR6E6ol
X-Gm-Gg: AYBFou27NUEyelMjlVKnXBjhnSMjeL9JLEa8rqukHvfQAZmO/hX0hGa2ZF0/cO7rNtP
	XkjDEDZoM5jERgtrUyX93g2Oy459k9gPeGPEX/Cpql5L+YNrqdWGQCOmJxTRaUJRNKAuoioeGcD
	UtjXnIZ7avSj7NLil7ky25o0KEOEv3Sp4ItVcKPP5RVm5XI8qoyRvQVjZQx2bel+rMEksCbjXKc
	fRvJ/cd6GDqiWoXpY8Ihhxw/zfkhmWhJ97BjpW55qDptlWU+POCc1tjNbzVFDKnluG90OtzGzHi
	TI7LMy8fM2xCiE23xGuH3ae/wY0YAz7XJAdWGlIy6SO0cORIirvYEMwK5J5FxP7s1usXhN+Es4c
	QtZnWdFtoofv52aCFgbXuOYwj1Dd+hrjgz2C8Ep0Ck8D6doFgyW9LtvTJBqE0ZtrILxRuF16xyV
	YDDHE4XuuB2ZWOCVGh7CNB2hwM76it0hcXuOFj1MrKFNiYkSApNO/scx+igzmfgsOgwkNxeuiSk
	iGRmX/hSg7QH92HTob+kPc+Y2YNalb3Cb2Ahp351HcGZRve8/8Qx/VGeg3ONx7X0K/ZCHRDar3n
	j44Lyvd2SbLPuHu6E+21xE9DL4i0tDxLh3EeIIKLG7IeRUYPSBSU2eARKQPwSm389+Get42A+Vs
	5WLx6AskbY5kt2I3VzYojV7SeJaajGYyPY5hK4QwyYJ/FQR5RwP7ksGtHTHAkf1BH5qDBUzw=
X-Received: by 2002:a05:6214:4c44:b0:91e:93eb:5977 with SMTP id 6a1803df08f44-91f2421b208mr133867276d6.35.1794802188373;
        Sun, 15 Nov 2026 20:09:48 -0800 (PST)
Return-Path: <bruce.ashfield@gmail.com>
Received: from [127.0.1.1] (pool-174-112-34-35.cpe.net.cable.rogers.com. [174.112.34.35])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-91f23d73206sm77559536d6.25.2026.11.15.20.09.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 20:09:48 -0800 (PST)
Message-ID: <6afa820c.01036f89.11cd8a.6ff7@mx.google.com>
Date: Sun, 15 Nov 2026 20:09:48 -0800 (PST)
From: Bruce Ashfield <bruce.ashfield@gmail.com>
To: Tanguy Raufflet <tanguy.raufflet@savoirfairelinux.com>
Cc: meta-virtualization@lists.yoctoproject.org
Subject: Re: [meta-virtualization][PATCH 1/2] image-oci: add OCI runtime bundle output
In-Reply-To: <1074218742.1918618.1793711762503.JavaMail.zimbra@savoirfairelinux.com>
References: <20260930144705.64792-1-tanguy.raufflet@savoirfairelinux.com>
 <6abd3113.e51cd04b.1fe4c8.0684@mx.google.com>
 <1760387508.1766093.1791807841997.JavaMail.zimbra@savoirfairelinux.com>
 <6ada5b42.4bcc4235.70a25.8048@mx.google.com>
 <1074218742.1918618.1793711762503.JavaMail.zimbra@savoirfairelinux.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
MIME-Version: 1.0
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by lin-tor-korg-lkml-alma10-1 with HTTPS for <meta-virtualization@lists.yoctoproject.org>; Mon, 16 Nov 2026 04:09:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/10167

Hi Tanguy,

> We'd be happy to contribute follow-up enhancements once you've pushed
> your WIP branch. In the meantime, we'd also be glad to help test the
> changes or review before merging.

The series is now on master-next. Testing it against your containers
and reviewing it would be great.

> Based on our current config.json, the runtime settings we would like
> to express through recipe variables are listed below. The OCI*BUNDLE*\*
> names are only suggestions:

I went with OCI_RUNTIME_* for these, since they're runtime spec
settings. Everything on your list is there, plus devices, terminal and
a read-only rootfs. The defaults are in the variables, so assigning one
replaces it and += / :remove adjust it. image-oci.bbclass has the
format of each one, and docs/container-bundling.md lists them. Setting
both the uid and gid mappings gives the container a private user
namespace.

The bundle is selected with OCI_IMAGE_OUTPUT_MODE = "bundle", or
"image bundle" for both, and deploys an -oci-bundle.tar. It's unpacked
from the final image, so process.args is the entrypoint followed by
cmd.

> Also, our container config.json needs to hold template fields that will be
> filled at installation. Example: a mountpoint to an instance's specific data
> directory. The proposal sounds compatible, we can use a placeholder like
> @INSTANCE_DIR@ in the variables and need to do our post-processing
> at runtime.

Values like @INSTANCE_DIR@ are passed through as is, for you to fill
in.

There are also crun and runc container profiles, BUNDLED_CONTAINERS
installs bundles with a systemd service on those hosts, and vrnc / vcrn
in the vcontainer SDK run a bundle on the build host.

> Additional runtime settings not listed above may also need to be overridden
> by downstream users (e.g., apparmorProfile, oomScoreAdj, scheduler
> settings, and hooks).

Those aren't in yet. If you need them, let me know and I'll do some
more thinking on them.

Bruce
