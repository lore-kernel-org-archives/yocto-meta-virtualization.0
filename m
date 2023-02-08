Return-Path: <bruce.ashfield@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 95CCFC636CC
	for <webhook@archiver.kernel.org>; Wed,  8 Feb 2023 14:48:17 +0000 (UTC)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com [209.85.166.53])
 by mx.groups.io with SMTP id smtpd.web10.10266.1675867691643499306
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 08 Feb 2023 06:48:11 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=morc0Cxb;
 spf=pass (domain: gmail.com, ip: 209.85.166.53, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-io1-f53.google.com with SMTP id e2so7013796iot.11
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Feb 2023 06:48:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=BP/2fVGY06RRL/nfS+IBbfvVPpNDmkCKgiFrg+AIlhQ=;
        b=morc0Cxbf5ltWJMGPS5rC1Gvlnl2PrNmF+UrwtFBE5kO1I3wL/bgUfo/VVk4avPpwv
         kvtUiAV7AXfrot4P+1RatmIMyGMnElKDoJ0Jr7HqCq6KzM6kyIATcd8X165076+zFvdI
         73pkj4GH55AMVCWhd0E7vqwlBfhvnwOvorQx/efez63nE6f0RPudQhKLHxpVcWTZoPHG
         VT6byN8W5bNwJXVC1jKkyroSpdDT+PHbRr/V6ngukqB19hscRVMvUpioCKbbAdji0SwA
         tNgxrAD20MiqJheYkTAygPF1TgH6PtETzok800hx8OL3pe7ZmehvxQeeOB+lioonkitI
         YfrQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BP/2fVGY06RRL/nfS+IBbfvVPpNDmkCKgiFrg+AIlhQ=;
        b=ePKB+9U0CI6qlhpaXcSRAJ0BhD7X9FzGUKQRl1Rex1yzar565ynYbLCM6av/jYKOJr
         MOCa71Kj94rfa/j4c0XxkETFcYPt0y+ldUBZVInTEmZLvy/qN0eBiVZJKvNSrxPqow0u
         uj2KUIws1+oanWadhQNGIaf65OwgOCd+Kv2zPlDt7RxWZWiI0DgU1oeQ0wdugl8lvG4E
         QvzGpGvpq3ZNhAzIRqXvlcS68qo/m4p3JQBKwaFnIPOvhH/Rk/5tSfbNH4wJsU+njJxc
         OVh00v8zqH2J0jTBe3wiUzXNBYeM0anhIZlROBHsLTC5GwfmKrS0G3wNXUHuirZ/1W+X
         Q8Ag==
X-Gm-Message-State: AO0yUKWG4tjXDD/L1gRtb0+pd1sXiUSsc/sbrEPPM9iKLyjQzcRaRWr+
	N9x91F4pQU/z3kUT5mh7C+Z43xJwmAwH7qIYLTs=
X-Google-Smtp-Source: AK7set+/g8voIS2Ue6Oj4chpF+VaPsdk4feXLl5B+GQCsQxVTVpOVZ2UueDtYmEe8ACr6V3LAuduDBdNyFYU1alqZg0=
X-Received: by 2002:a02:c953:0:b0:3a9:7066:1ad5 with SMTP id
 u19-20020a02c953000000b003a970661ad5mr4879244jao.38.1675867690656; Wed, 08
 Feb 2023 06:48:10 -0800 (PST)
MIME-Version: 1.0
References: <20230131072907.193332-1-mingli.yu@eng.windriver.com>
 <173F54303363EB50.28029@lists.yoctoproject.org> <b8fa36be-5437-3a45-edda-e37f26d7adc0@windriver.com>
In-Reply-To: <b8fa36be-5437-3a45-edda-e37f26d7adc0@windriver.com>
From: Bruce Ashfield <bruce.ashfield@gmail.com>
Date: Wed, 8 Feb 2023 09:47:59 -0500
Message-ID: <CADkTA4NUSxsnwjFnbFPENm1FE3jk2_m5++4td35KRV+smSPeRg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 2/3] yq: Upgrade to 4.30.8
To: "Yu, Mingli" <mingli.yu@windriver.com>
Cc: "Yu, Mingli" <mingli.yu@eng.windriver.com>, meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Wed, 08 Feb 2023 14:48:17 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7848

Apologies. I was trying to decide if I'd convert this to match the
other generated vendor recipes, and forgot to reply.

I've queued this now and will do some testing.

Bruce

On Tue, Feb 7, 2023 at 10:19 PM Yu, Mingli <mingli.yu@windriver.com> wrote:
>
> Ping.
>
> Thanks,
>
> On 1/31/23 15:29, Yu, Mingli wrote:
> > From: Mingli Yu <mingli.yu@windriver.com>
> >
> > Upgrade yq to 4.30.8 [1].
> >
> > [1] https://github.com/mikefarah/yq/releases/tag/v4.30.8
> >
> > Signed-off-by: Mingli Yu <mingli.yu@windriver.com>
> > ---
> >   recipes-devtools/yq/yq_git.bb | 50 +++++++++++++++++++++++------------
> >   1 file changed, 33 insertions(+), 17 deletions(-)
> >
> > diff --git a/recipes-devtools/yq/yq_git.bb b/recipes-devtools/yq/yq_git.bb
> > index daa9ab8f..867bfccf 100644
> > --- a/recipes-devtools/yq/yq_git.bb
> > +++ b/recipes-devtools/yq/yq_git.bb
> > @@ -2,33 +2,49 @@ SUMMARY = "a lightweight and portable command-line YAML processor "
> >   HOMEPAGE = "https://github.com/mikefarah/yq"
> >
> >   LICENSE = "MIT"
> > -LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=090d381b4b3eb93194e8cbff4aaae2de"
> > +LIC_FILES_CHKSUM = "file://src/${GO_IMPORT}/LICENSE;md5=e40a0dcd62f8269b9bff37fe9aa7dcc2"
> >
> > -SRCREV_yq = "e0f5cb3c5958e57c7f250a7030e92c768c1b2b19"
> > +SRCREV_yq = "dd6cf3df146f3e2c0f8c765a6ef9e35780ad8cc1"
> >   SRCREV_color = "daf2830f2741ebb735b21709a520c5f37d642d85"
> > -SRCREV_lexer = "81f720df2c51e9f1e1d387b17a0af386ed2b257d"
> > -SRCREV_debug = "fa7b53cdfc9105c70f134574002f406232921437"
> > -SRCREV_errors = "614d223910a179a466c1767a985424175c39b465"
> > -SRCREV_cobra = "b97b5ead31f7d34f764ac8666e40c214bb8e06dc"
> > -SRCREV_pflag = "6971c29c4a22981adeaee7f4b437c0cffe08c031"
> > +SRCREV_lexer = "6cdefc42e112ac71cbe316e1eed264ea62f58e25"
> > +SRCREV_cobra = "b43be995ebb4bee335a787bd44498b91aef7619c"
> > +SRCREV_pflag = "2e9d26c8c37aae03e3f9d4e90b7116f5accb7cab"
> >   SRCREV_logging = "b2cb9fa56473e98db8caba80237377e83fe44db5"
> > -SRCREV_yaml = "eeeca48fe7764f320e4870d231902bf9c1be2c08"
> > -SRCREV_xerrors="5ec99f83aff198f5fbd629d6c8d8eb38a04218ca"
> > +SRCREV_yaml = "f6f7691b1fdeb513f56608cd2c32c51f8194bf51"
> > +SRCREV_xerrors="65e65417b02f28de84b55f16b46a1e789149973a"
> > +SRCREV_envsubst = "16035fe3571ad42c7796bf554f978bb2df64231b"
> > +SRCREV_participle = "49f4822ed012d9818c80ca4fcdeb7e2d55c04806"
> > +SRCREV_utfbom = "6ae8f945ca96f30defc7e8ab12ec5d10cf86ded4"
> > +SRCREV_orderedmap = "1e43e194ff533a346bab5f9b66b738256f199c8a"
> > +SRCREV_go-json = "5efc7d07eeeba186df630d9ab4ac78c761938c27"
> > +SRCREV_copier = "d132b069fe1a77d09e4c260852b389a730bbe9ba"
> > +SRCREV_properties = "c9a06e8f8f0164e4e16c0d5c4793cbed4ac90264"
> > +SRCREV_net = "f3363e06e74cdc304618bf31d898b78590103527"
> > +SRCREV_text = "434eadcdbc3b0256971992e8c70027278364c72c"
> > +SRCREV_diff = "20ebb0f2a09e612109b224b32f79370409108bcc"
> >
> >   SRCREV_FORMAT = "yq_color"
> >   SRC_URI = "git://${GO_IMPORT};name=yq;branch=master;protocol=https \
> >              git://github.com/fatih/color;name=color;destsuffix=build/vendor/src/github.com/fatih/color;branch=main;protocol=https \
> >              git://github.com/goccy/go-yaml;name=lexer;destsuffix=build/vendor/src/github.com/goccy/go-yaml/;branch=master;protocol=https \
> > -           git://github.com/kylelemons/godebug;name=debug;destsuffix=build/vendor/src/github.com/kylelemons/godebug/;branch=master;protocol=https \
> > -        git://github.com/pkg/errors;name=errors;destsuffix=build/vendor/src/github.com/pkg/errors/;branch=master;protocol=https \
> > -        git://github.com/spf13/cobra;name=cobra;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
> > -        git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
> > -        git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
> > -        git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
> > +            git://github.com/spf13/cobra.git;name=cobra;nobranch=1;destsuffix=build/vendor/src/github.com/spf13/cobra;branch=main;protocol=https \
> > +            git://github.com/spf13/pflag;name=pflag;destsuffix=build/vendor/src/github.com/spf13/pflag;branch=master;protocol=https \
> > +            git://github.com/op/go-logging.git;name=logging;destsuffix=build/vendor/src/gopkg.in/op/go-logging.v1;branch=master;protocol=https \
> > +            git://github.com/go-yaml/yaml.git;name=yaml;branch=v3;destsuffix=build/vendor/src/gopkg.in/yaml.v3;protocol=https \
> >              git://github.com/golang/xerrors;name=xerrors;protocol=https;nobranch=1;destsuffix=build/vendor/src/golang.org/x/xerrors \
> > +           git://github.com/a8m/envsubst;name=envsubst;destsuffix=build/vendor/src/github.com/a8m/envsubst;branch=master;protocol=https \
> > +           git://github.com/alecthomas/participle;name=participle;destsuffix=build/vendor/src/github.com/alecthomas/participle;branch=master;protocol=https \
> > +           git://github.com/dimchansky/utfbom;name=utfbom;destsuffix=build/vendor/src/github.com/dimchansky/utfbom;branch=master;protocol=https \
> > +           git://github.com/elliotchance/orderedmap;name=orderedmap;destsuffix=build/vendor/src/github.com/elliotchance/orderedmap;branch=master;protocol=https \
> > +           git://github.com/goccy/go-json;name=go-json;destsuffix=build/vendor/src/github.com/goccy/go-json;branch=master;protocol=https \
> > +           git://github.com/jinzhu/copier;name=copier;destsuffix=build/vendor/src/github.com/jinzhu/copier;branch=master;protocol=https \
> > +           git://github.com/magiconair/properties;name=properties;destsuffix=build/vendor/src/github.com/magiconair/properties;branch=main;protocol=https \
> > +           git://github.com/golang/net;name=net;destsuffix=build/vendor/src/golang.org/x/net;branch=master;protocol=https \
> > +           git://github.com/golang/text;name=text;destsuffix=build/vendor/src/golang.org/x/text;branch=master;protocol=https \
> > +           git://github.com/pkg/diff;name=diff;destsuffix=build/vendor/src/github.com/pkg/diff;branch=main;protocol=https \
> >              "
> >
> > -PV = "1.13.1+git${SRCREV_yq}"
> > +PV = "4.30.8+git${SRCREV_yq}"
> >   GO_IMPORT = "github.com/mikefarah/yq"
> >
> >   inherit go
> > @@ -45,12 +61,12 @@ do_compile:prepend() {
> >       export GO111MODULE=off
> >   }
> >
> > -
> >   do_install:append() {
> >       # these bring in dependencies for the -dev package on bash, and we don't
> >       # need them .. so we remove them to avoid needing that rdepends
> >       rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/debian/rules
> >       rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/scripts
> > +    rm -rf ${D}/${libdir}/go/src/${GO_IMPORT}/acceptance_tests
> >   }
> >
> >   BBCLASSEXTEND = "native"
> >
> >
> >
> > -=-=-=-=-=-=-=-=-=-=-=-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#7839): https://lists.yoctoproject.org/g/meta-virtualization/message/7839
> > Mute This Topic: https://lists.yoctoproject.org/mt/96648196/3618448
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub [mingli.yu@eng.windriver.com]
> > -=-=-=-=-=-=-=-=-=-=-=-
> >



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

