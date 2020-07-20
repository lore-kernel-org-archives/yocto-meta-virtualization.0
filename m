Received: from mail-oi1-f194.google.com (mail-oi1-f194.google.com [209.85.167.194])
 by mx.groups.io with SMTP id smtpd.web11.42036.1595263456433977101
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 20 Jul 2020 09:44:16 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=hY7O7NMC;
 spf=pass (domain: gmail.com, ip: 209.85.167.194, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-oi1-f194.google.com with SMTP id h17so14884497oie.3
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 20 Jul 2020 09:44:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MUslEa1yhe9Z3voRb9NCW+lslL9VQ3Q8DVw33ADvVLU=;
        b=hY7O7NMCSRClqTGR/XgGE7Pn6UdyfcMM+KGRPedsAeRQcBpZWCZF8EAGKaLyWsuOMq
         ULoe+3vOQW/5tIZbYYLzGR8zHLRPD8xX08BGDNDNgBHgwV1pdEX2ejqPyAg4nl+xUgp7
         GsaTmbxwdqgrqtiOXLhPvs9MuJoWdJTmfE2hzEHmbPMBP+IW8tZe+TP0foPzT/21eonX
         7FrAOl5bx+1BwArRB/p/kUQ3YAu2lPbN9VnyQqX+3nxDvzlFtqEDAXGaBYtOsnAHoNv+
         NDHtO041UkGWorz6ISH7g+yDGSZAH1w+zSSFPQtCFZFOR8NNv7aTYU1nJuvvfhQdYxDb
         tkbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MUslEa1yhe9Z3voRb9NCW+lslL9VQ3Q8DVw33ADvVLU=;
        b=bgR7u1WWrKayEyPcjs7Ba6Usx+svSDeWRuGqfbx0io1TePr0s0/ht8YPqY/eK6HbkD
         3a4omq5yjc++U+p1lPo2MogKnKcgEz8Wg8kESapldeX14hxCO2BL13FeyzZseSEzQ2Fx
         WtL9QyMc4nRsqolNRpbM+E3BZfHU/XeGSd1NxiL24mBs9bY0MyEZ1pvRzqtG0QWKykBG
         3/+LvOAX2EQADOALdDqTuzrm0nfXIBagQ2Hr5d/dis9REStqOwy9blknwLH+sqBvD1Ig
         TrI/KuE5lVMKndwFECa/6IFGNmtsRVucfcIFabX5DXDwcktPiJaxRAB8kD4PXDTsXk6g
         O4HA==
X-Gm-Message-State: AOAM53204QmEH7oJm1ZNkNbqcvmjGalCyqkDI+M/4yP1VTeMiANiT/20
	a09v1VwU9Lumw5eILcTcW+1P2VUiTKAt945aIp4=
X-Google-Smtp-Source: ABdhPJx2AFfrviieUwVS5Y6q8bMxblVKe7YVJeoTF5Fp4Js1QO2Xl74G2fceVdFWca7lgMfla77YL+qPTk9k73z/sh4=
X-Received: by 2002:aca:fc87:: with SMTP id a129mr208574oii.28.1595263455702;
 Mon, 20 Jul 2020 09:44:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200717210349.16459-3-christopher.w.clark@gmail.com> <16433.1595137077947997501@lists.yoctoproject.org>
In-Reply-To: <16433.1595137077947997501@lists.yoctoproject.org>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Mon, 20 Jul 2020 09:44:04 -0700
Message-ID: <CACMJ4GZqViJOPo+wmCKZsBsxf8zoOxZkmkUbnr_ca-pz3of8oQ@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 3/4] xen: drop vars that duplicate hvc console from the r-pi4 config
To: Ashish <ashishm@mvista.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sat, Jul 18, 2020 at 10:38 PM Ashish <ashishm@mvista.com> wrote:
>
> Hi Christopher ,
>
> Can you please provide some inputs for :
>
> - To build xen-image-minimal using master branch of meta-virtualization Whats the branch suggested to be used for layers ( meta-openembedded / meta-raspberrypi & poky )

Hi Ashish

I have been building xen-image-minimal using the master branch of each
of: poky, meta-raspberrypi, meta-openembedded and meta-virtualization
with the submitted patches applied.

I would recommend doing this if your aim is to develop patches for
submissions to this list and inclusion in the next Yocto release,
since building it this way will test compatibility of your work with
current component versions. It is often more unstable than developing
against a release branch though.

> - I am trying dunfell branch ( meta-openembedded / meta-raspberrypi & poky ) with master branch of meta-virtualization
>
> Idea is to get image with the latest patches being pushed for XEN & also to understand setup being used by community.

At the point where a patch series for Xen is posted, you should be
able to build and test it with master across each of the repositories.

Christopher

>
> Thanks ,
> Ashish
>
>
>
> 
