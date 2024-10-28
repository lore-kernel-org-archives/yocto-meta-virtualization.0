Return-Path: <matthias.schoepfer@googlemail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F0D99D13588
	for <webhook@archiver.kernel.org>; Mon, 28 Oct 2024 09:35:59 +0000 (UTC)
Received: from mail-ej1-f41.google.com (mail-ej1-f41.google.com [209.85.218.41])
 by mx.groups.io with SMTP id smtpd.web11.47712.1730108150789837517
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 28 Oct 2024 02:35:51 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@googlemail.com header.s=20230601 header.b=K9oqmcZb;
 spf=pass (domain: googlemail.com, ip: 209.85.218.41, mailfrom: matthias.schoepfer@googlemail.com)
Received: by mail-ej1-f41.google.com with SMTP id a640c23a62f3a-a9a6acac4c3so635970566b.0
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 02:35:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=googlemail.com; s=20230601; t=1730108149; x=1730712949; darn=lists.yoctoproject.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fPbgTx/VAvSlfmHtu7qVeUEncOb+Lg3twpJhZxTnMBs=;
        b=K9oqmcZbtyjGmbmJGcqGfCKBOIwFlKNHPm5CSroDHiBA9GFnoYDbO5tZZ+V1Zg0IM4
         RjBDsamb0o6sfHlDtiSr0BZbdFjwJCcKL0yTMrMGGgRWhXFOGAR5kYyP/fCLfvtQjduF
         P7u0iOmwUgXkO+ooICe3dMg/6ovhzTygAhV6bdiNnNB5lsa7+S8ZeDfRm+GRvat8HuYf
         h65ElnuyXgFS5bIPFhfpXWAHpqtprvgBSfE5d8fdvMR+pU8YT+pKBnPF0JIUgBW4snR/
         N/kIX1JM2U0fZoRvfCGHsMWkLRcqx7ym9JnHmkVOef+OO/tAAQIkpz8gGNOJX7yfC8+Q
         rAlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730108149; x=1730712949;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=fPbgTx/VAvSlfmHtu7qVeUEncOb+Lg3twpJhZxTnMBs=;
        b=SpDxvPzLTp344PffUc1GV8NNA6AGNHOF25IiJZu4WXNfgdMXMjh32WgiBnPl/cGhLC
         pUiK/Lewa46OV7miBAAzT1XcxeGoarhQIJSz2fDCV63qpqE5UrpGpGUtGXDBzWM0+LJW
         foGxqSc3g0j7mlHOZGE56TRcWNQOoNO/5zKJi4dIzZubsHwqa88Cx/htu4/eTRFLry+H
         yE20aZz6rnNMnf3R64KLtykaLqkviDBuqdbo1oWI/dceRaYGduXj7J0PZOwlZFAvS9o5
         zcJRg9tcSVx7isQ7ClUyq3QmiJLcwg/jgBnPW7J30Wuw7VvEjwbB42Pf/pDrbFoH1roI
         otLQ==
X-Gm-Message-State: AOJu0YzuMnFin1FEvYB+apYna0FNkgPyU9YKqefre+HBtYHykXNbmmYK
	2jmIWw/UCChQRB2KELzHnOc5CFEbjKyq0zjpNwnvyzEXVx1m6DRG
X-Google-Smtp-Source: AGHT+IGDCs5VjjMsbTf7RZFjgF7uDfzsdqrExwM4mp2FBjNWi2o1CC/hh/v5iDBb/Q6TJN1OTXLJEA==
X-Received: by 2002:a17:907:1c29:b0:a99:e67a:d12d with SMTP id a640c23a62f3a-a9de61ce61bmr707649566b.48.1730108148472;
        Mon, 28 Oct 2024 02:35:48 -0700 (PDT)
Received: from [192.168.178.41] (ip-088-152-186-249.um26.pools.vodafone-ip.de. [88.152.186.249])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-a9b30d6fefesm355865866b.165.2024.10.28.02.35.47
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 02:35:47 -0700 (PDT)
Content-Type: multipart/alternative;
 boundary="------------rREYQDksGcZH0W6tpER9rz3a"
Message-ID: <0cc9e74c-cd92-46d6-be2c-3aea9a899224@googlemail.com>
Date: Mon, 28 Oct 2024 10:35:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-virtualization] How to write a recipe that downloads a
 docker image and puts it into the (readonly) root file system
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
References: <14c95bc9-8cd2-4c24-8b9b-cf8bb53f860a@googlemail.com>
 <CADkTA4NsT2xQbd7HCq19GB=vSvRAXtFaT637hj-R+xKZK=KFCQ@mail.gmail.com>
Content-Language: en-US, de-DE
From: Matthias Schoepfer <matthias.schoepfer@googlemail.com>
In-Reply-To: <CADkTA4NsT2xQbd7HCq19GB=vSvRAXtFaT637hj-R+xKZK=KFCQ@mail.gmail.com>
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 28 Oct 2024 09:35:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8939

This is a multi-part message in MIME format.
--------------rREYQDksGcZH0W6tpER9rz3a
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Hi Bruce,

Thanks for your extensive answer and also the great work you put into 
meta-virtualization <3

I watched some of your talks on youtube. Very good structure, it helped 
me a lot.

I fully understand the technical and architectural reasons, and I try to 
get my customer slowly towards the retirement of the containers in favor 
of a clean yocto integration. But there are social aspects (developers 
are used to containers and since they kinda behave like ubuntu, they 
know their way around). So we need to do the transition slowly to keep 
everybody on board.

Thank you for your input  and ideas, I think I can craft something on 
this basis.

Regards,

    Matthias

On 10/25/24 19:19, Bruce Ashfield wrote:
>
>
> On Fri, Oct 25, 2024 at 8:49 AM Matthias Schoepfer via 
> lists.yoctoproject.org <http://lists.yoctoproject.org> 
> <matthias.schoepfer=googlemail.com@lists.yoctoproject.org> wrote:
>
>     Hi!
>
>     I have been searching the web but have only found tons of stuff
>     how to
>     build a yocto image in a docker container, and some how to build a
>     container from a yocto recipe. I need to embed a (couple of) (docker)
>     containers into a readonly root file system. It is meant to be an
>     intermediate step before simply integrating all the services directly
>     into the image. What can I say.
>
>     My Idea is to for example podman pull the image and redirect the
>     storage
>     location into the ${D} space. On the machine, it should be
>     possible to
>     configure podman to include this directory.
>
>
> There's been several posts on the list, and even a session at one of
> the hands-on labs (I think it was within the last year), talking about
> doing just that.
>
> For both technical and architectural reasons, those approaches aren't
> something that will merge into OE core, or meta-virtualization.  The
> reasons have been discussed in those other threads, so I won't repeat
> them here as I'm a bit short on time, but didn't want to leave this
> unanswered (there are licensing, compatibility, traceability, 
> reproducibility,
> etc, issues).
>
> For meta-virtualization, I call it "cross installation of containers", and
> while it could support (and I'm leaving that door open) 3rd party built
> containers, it is targeted for containers that have been built with the
> yocto project itself.  The external containers will be an exercise left
> up to people in their own layers.
>
>
>     While I can pull images on my host, when I try to write a recipe
>     (extending podman to be -native), I get all kinds of funny errors...
>     Also tried buildah.
>
>
> That all being said, there is work being completed in this area, and
> I'm starting to push some of the support bits to master-next right now.
>
> That includes a native set of tools, since in order for it to get into
> meta-virtualization, it has to work with all the runtimes. I already have
> podman, containerd, etc, working, docker is still the outlier that I'm
> trying to get working without special permissions.
>
> While waiting for that, you can easily work around the need for
> -native versions of the yocto tools. I've done plenty of prototyping
> with build machine container tools and haven't had any issues
> (and in fact those talks and hands on classes I mentioned are
> doing that as well).
>
> The problem with docker is that the container file system storage
> isn't the OCI standard, and it really isn't documented in a way that
> I've been able to understand yet. So you can run docker on the
> build host, pull a container to make it available and then copy it
> into the target rootfs while it is being built .. having it show up to
> the target docker and be "runnable" is the challenge.
>
> I'm playing around with running the target in qemu during the
> build and letting docker install that way. But I'm not happy ith
> it yet.
>
> Alternatively, if you are running a fully read only rootfs, your
> container state is going to be lost when they exit (and after
> a reboot), so you could just mount a tmpfs over the container
> store, have the containers available in the readonly rootfs and
> have docker import them on first boot.
>
> podman has some extra flexibility as it is using a container store
> that is manipulated by OCI tool so you can more easily run podman
> on the build host and install it to the target rootfs and have it
> show up as runnable.
>
> Which takes me back to my first statement that for this to land
> in meta-virt, I need all the container runtime options working, which
> is what is taking the extra time.
>
> Bruce
>
>
>     Sorry, I am noob in the side of the containers and their format. I
>     always tried to avoid them, as they seem to me as an option to "just
>     static link everything" to not have to bother with dependency issues.
>
>     Any hints and links are welcome.
>
>     ```
>
>     [storage.options]
>     # Storage options to be passed to underlying storage drivers
>
>     # AdditionalImageStores is used to pass paths to additional Read/Only
>     image stores
>     # Must be comma separated list.
>     additionalimagestores = [
>     ]
>     ```
>
>     Thanks and Regards,
>
>          Matthias
>
>
>     -=-=-=-=-=-=-=-=-=-=-=-
>     Links: You receive all messages sent to this group.
>     View/Reply Online (#8935):
>     https://lists.yoctoproject.org/g/meta-virtualization/message/8935
>     Mute This Topic: https://lists.yoctoproject.org/mt/109206904/1050810
>     Group Owner: meta-virtualization+owner@lists.yoctoproject.org
>     <mailto:meta-virtualization%2Bowner@lists.yoctoproject.org>
>     Unsubscribe:
>     https://lists.yoctoproject.org/g/meta-virtualization/unsub
>     [bruce.ashfield@gmail.com]
>     -=-=-=-=-=-=-=-=-=-=-=-
>
>
>
> -- 
> - Thou shalt not follow the NULL pointer, for chaos and madness await 
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>
--------------rREYQDksGcZH0W6tpER9rz3a
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: 8bit

<!DOCTYPE html>
<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p>Hi Bruce,</p>
    <p>Thanks for your extensive answer and also the great work you put
      into meta-virtualization &lt;3 <br>
    </p>
    <p>I watched some of your talks on youtube. Very good structure, it
      helped me a lot. <br>
    </p>
    <p>I fully understand the technical and architectural reasons, and I
      try to get my customer slowly towards the retirement of the
      containers in favor of a clean yocto integration. But there are
      social aspects (developers are used to containers and since they
      kinda behave like ubuntu, they know their way around). So we need
      to do the transition slowly to keep everybody on board. <br>
    </p>
    <p>Thank you for your input  and ideas, I think I can craft
      something on this basis. <br>
    </p>
    <p>Regards,</p>
    <p>   Matthias<br>
    </p>
    <div class="moz-cite-prefix">On 10/25/24 19:19, Bruce Ashfield
      wrote:<br>
    </div>
    <blockquote type="cite"
cite="mid:CADkTA4NsT2xQbd7HCq19GB=vSvRAXtFaT637hj-R+xKZK=KFCQ@mail.gmail.com">
      <meta http-equiv="content-type" content="text/html; charset=UTF-8">
      <div dir="ltr">
        <div dir="ltr">
          <div class="gmail_default" style="font-size:small"><br>
          </div>
        </div>
        <br>
        <div class="gmail_quote">
          <div dir="ltr" class="gmail_attr">On Fri, Oct 25, 2024 at
            8:49 AM Matthias Schoepfer via <a
              href="http://lists.yoctoproject.org" target="_blank"
              moz-do-not-send="true">lists.yoctoproject.org</a>
            &lt;matthias.schoepfer=<a
              href="mailto:googlemail.com@lists.yoctoproject.org"
              target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">googlemail.com@lists.yoctoproject.org</a>&gt;
            wrote:<br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">Hi!<br>
            <br>
            I have been searching the web but have only found tons of
            stuff how to <br>
            build a yocto image in a docker container, and some how to
            build a <br>
            container from a yocto recipe. I need to embed a (couple of)
            (docker) <br>
            containers into a readonly root file system. It is meant to
            be an <br>
            intermediate step before simply integrating all the services
            directly <br>
            into the image. What can I say.<br>
            <br>
            My Idea is to for example podman pull the image and redirect
            the storage <br>
            location into the ${D} space. On the machine, it should be
            possible to <br>
            configure podman to include this directory.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">There's
              been several posts on the list, and even a session at one
              of</div>
            <div class="gmail_default" style="font-size:small">the
              hands-on labs (I think it was within the last year),
              talking about</div>
            <div class="gmail_default" style="font-size:small">doing
              just that.</div>
            <div class="gmail_default" style="font-size:small"><br>
            </div>
            <div class="gmail_default" style="font-size:small">For both
              technical and architectural reasons, those approaches
              aren't</div>
          </div>
          <div class="gmail_default" style="font-size:small">something that
            will merge into OE core, or meta-virtualization.  The</div>
          <div class="gmail_default" style="font-size:small">reasons
            have been discussed in those other threads, so I won't
            repeat</div>
          <div class="gmail_default" style="font-size:small">them here
            as I'm a bit short on time, but didn't want to leave this</div>
          <div class="gmail_default" style="font-size:small">unanswered
            (there are licensing, compatibility, traceability,
            reproducibility,</div>
          <div class="gmail_default" style="font-size:small">etc,
            issues).</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">For
            meta-virtualization, I call it "cross installation of
            containers", and</div>
          <div class="gmail_default" style="font-size:small">while it
            could support (and I'm leaving that door open) 3rd party
            built</div>
          <div class="gmail_default" style="font-size:small">containers,
            it is targeted for containers that have been built with the</div>
          <div class="gmail_default" style="font-size:small">yocto
            project itself.  The external containers will be an exercise
            left</div>
          <div class="gmail_default" style="font-size:small">up to
            people in their own layers.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            While I can pull images on my host, when I try to write a
            recipe <br>
            (extending podman to be -native), I get all kinds of funny
            errors... <br>
            Also tried buildah.<br>
          </blockquote>
          <div><br>
          </div>
          <div>
            <div class="gmail_default" style="font-size:small">That all
              being said, there is work being completed in this area,
              and</div>
          </div>
          <div>I'm starting to push <span class="gmail_default"
              style="font-size:small">some of the support bits to
              master-next right now.</span><br>
          </div>
          <div><span class="gmail_default" style="font-size:small"><br>
            </span></div>
          <div><span class="gmail_default" style="font-size:small">That
              includes a native set of tools, since in order for it to
              get into</span></div>
          <div><span class="gmail_default" style="font-size:small">meta-virtualization,
              it has to work with all the runtimes. I already have</span></div>
          <div><span class="gmail_default" style="font-size:small">podman,
              containerd, etc, working, docker is still the outlier that
              I'm</span></div>
          <div>
            <div class="gmail_default" style="font-size:small">trying to
              get working without special permissions.</div>
          </div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">While
            waiting for that, you can easily work around the need for</div>
          <div class="gmail_default" style="font-size:small">-native
            versions of the yocto tools. I've done plenty of prototyping</div>
          <div class="gmail_default" style="font-size:small">with build
            machine container tools and haven't had any issues</div>
          <div class="gmail_default" style="font-size:small">(and in
            fact those talks and hands on classes I mentioned are</div>
          <div class="gmail_default" style="font-size:small">doing that
            as well).</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">The problem
            with docker is that the container file system storage</div>
          <div class="gmail_default" style="font-size:small">isn't the
            OCI standard, and it really isn't documented in a way that</div>
          <div class="gmail_default" style="font-size:small">I've been
            able to understand yet. So you can run docker on the</div>
          <div class="gmail_default" style="font-size:small">build host,
            pull a container to make it available and then copy it</div>
          <div class="gmail_default" style="font-size:small">into the
            target rootfs while it is being built .. having it show up
            to</div>
          <div class="gmail_default" style="font-size:small">the target
            docker and be "runnable" is the challenge. </div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">I'm playing
            around with running the target in qemu during the</div>
          <div class="gmail_default" style="font-size:small">build and
            letting docker install that way. But I'm not happy ith</div>
          <div class="gmail_default" style="font-size:small">it yet.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">Alternatively,
            if you are running a fully read only rootfs, your</div>
          <div class="gmail_default" style="font-size:small">container
            state is going to be lost when they exit (and after</div>
          <div class="gmail_default" style="font-size:small">a reboot),
            so you could just mount a tmpfs over the container</div>
          <div class="gmail_default" style="font-size:small">store, have
            the containers available in the readonly rootfs and</div>
          <div class="gmail_default" style="font-size:small">have docker
            import them on first boot.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">podman has
            some extra flexibility as it is using a container store</div>
          <div class="gmail_default" style="font-size:small">that is
            manipulated by OCI tool so you can more easily run podman</div>
          <div class="gmail_default" style="font-size:small">on the
            build host and install it to the target rootfs and have it</div>
          <div class="gmail_default" style="font-size:small">show up as
            runnable.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">Which takes
            me back to my first statement that for this to land</div>
          <div class="gmail_default" style="font-size:small">in
            meta-virt, I need all the container runtime options working,
            which</div>
          <div class="gmail_default" style="font-size:small">is what is
            taking the extra time.</div>
          <div class="gmail_default" style="font-size:small"><br>
          </div>
          <div class="gmail_default" style="font-size:small">Bruce</div>
          <div class="gmail_default" style="font-size:small"> <br>
          </div>
          <blockquote class="gmail_quote"
style="margin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1ex">
            <br>
            Sorry, I am noob in the side of the containers and their
            format. I <br>
            always tried to avoid them, as they seem to me as an option
            to "just <br>
            static link everything" to not have to bother with
            dependency issues.<br>
            <br>
            Any hints and links are welcome.<br>
            <br>
            ```<br>
            <br>
            [storage.options]<br>
            # Storage options to be passed to underlying storage drivers<br>
            <br>
            # AdditionalImageStores is used to pass paths to additional
            Read/Only <br>
            image stores<br>
            # Must be comma separated list.<br>
            additionalimagestores = [<br>
            ]<br>
            ```<br>
            <br>
            Thanks and Regards,<br>
            <br>
                 Matthias<br>
            <br>
            <br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            Links: You receive all messages sent to this group.<br>
            View/Reply Online (#8935): <a
href="https://lists.yoctoproject.org/g/meta-virtualization/message/8935"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/message/8935</a><br>
            Mute This Topic: <a
              href="https://lists.yoctoproject.org/mt/109206904/1050810"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.yoctoproject.org/mt/109206904/1050810</a><br>
            Group Owner: <a
href="mailto:meta-virtualization%2Bowner@lists.yoctoproject.org"
              target="_blank" moz-do-not-send="true">meta-virtualization+owner@lists.yoctoproject.org</a><br>
            Unsubscribe: <a
href="https://lists.yoctoproject.org/g/meta-virtualization/unsub"
              rel="noreferrer" target="_blank" moz-do-not-send="true"
              class="moz-txt-link-freetext">https://lists.yoctoproject.org/g/meta-virtualization/unsub</a>
            [<a href="mailto:bruce.ashfield@gmail.com" target="_blank"
              moz-do-not-send="true" class="moz-txt-link-freetext">bruce.ashfield@gmail.com</a>]<br>
            -=-=-=-=-=-=-=-=-=-=-=-<br>
            <br>
          </blockquote>
        </div>
        <br clear="all">
        <div><br>
        </div>
        <span class="gmail_signature_prefix">-- </span><br>
        <div dir="ltr" class="gmail_signature">- Thou shalt not follow
          the NULL pointer, for chaos and madness await thee at its end<br>
          - "Use the force Harry" - Gandalf, Star Trek II<br>
          <br>
        </div>
      </div>
    </blockquote>
  </body>
</html>

--------------rREYQDksGcZH0W6tpER9rz3a--

