Return-Path: <JPEWhacker@gmail.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9A64CDB47E
	for <webhook@archiver.kernel.org>; Fri, 13 Oct 2023 19:32:52 +0000 (UTC)
Received: from mail-lf1-f45.google.com (mail-lf1-f45.google.com [209.85.167.45])
 by mx.groups.io with SMTP id smtpd.web11.47880.1697225567705331466
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 13 Oct 2023 12:32:48 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20230601 header.b=Lwan9Itj;
 spf=pass (domain: gmail.com, ip: 209.85.167.45, mailfrom: jpewhacker@gmail.com)
Received: by mail-lf1-f45.google.com with SMTP id 2adb3069b0e04-505748580ceso3052167e87.3
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 12:32:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1697225566; x=1697830366; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=T33xo9zuCrWhIecnFzRiPtS7LCPUPZZCFd4F0F3VNfE=;
        b=Lwan9ItjZwzCpYxoz4zWKK5UpyKfsZEybK1uk6xm0p0kex0zDicHJhMk/I71KJ7ncK
         GREBrpLECr9C5mVpLQzPMRXpd9lkqPhdsJw4XxoprEF/OikhXLrrm2WQBzprLmoaFgEs
         ZoHtu2kys/rZ67MsT0C1UxjRgysAUIpJ/VKeIuywNhkSxt5Y0sK0N1dR7BlthyVPKB3M
         5hxkZ4yWNwQ9B131OYU3J6/mNSVEfBhvYQKGAPqcvCmj+eQ1YXc3FVC9Wdpj2/Fqiang
         3SBMmzIjxGrkJM9zw5IIqpOiMgiBJLzjVZpB+qjTSEKNp64iAoDmoH+uamzwuXuYM4V7
         xrMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1697225566; x=1697830366;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=T33xo9zuCrWhIecnFzRiPtS7LCPUPZZCFd4F0F3VNfE=;
        b=uksfQXuMZWmcBTK8BPDTGzk1x+pqk7ICYLiQME7oEYaj0N2WH3ByjVLtoo7zU0tShp
         ryU+urke6QzKN9S5pU2zLek+z3GX7XI06+nye474pC5c3BxM+/rIVAXnDZ8TRyQLZEm+
         nRDlqmPg7F3swWTm97CXNC33iPt1kv9k0hlloPXguo2yabuQ6XyZzauFMXToZPqnzabh
         nxHzQWXmrY1MHbwA0cEI5yHORKXVG4ev5zhy0HVvv4AeCecd63XnC0apeN/Q0W/ajuGj
         WxI+OOuwcqvZ9UBseq3GoO/LFFiBKETTVutiwMxpiDQYT7epniONLnX+6P9JsyCSvGO+
         4laA==
X-Gm-Message-State: AOJu0Yx7HIGyzJcokZNkwpmkbUN69qe+/MjJM0w5/KBBCbqCXBE4iq5m
	kUc4oAhuJdoG5FA5qYhWVvlESEESuj130D0MpsU=
X-Google-Smtp-Source: AGHT+IGYfz1O6bAto7rbJQRdG51MvGew3vMNWVXf9HM2VwpLDel+jf52YT6N792KUFwA+R3Z2jOxJjW5kV3/ZF0SP6Y=
X-Received: by 2002:ac2:4da8:0:b0:500:bffa:5b85 with SMTP id
 h8-20020ac24da8000000b00500bffa5b85mr20859609lfe.32.1697225565507; Fri, 13
 Oct 2023 12:32:45 -0700 (PDT)
MIME-Version: 1.0
References: <20231012162548.329780-1-JPEWhacker@gmail.com> <20231013153807.906542-1-JPEWhacker@gmail.com>
 <CADkTA4O-9_7c6iKoHP_vfDhfojqoY19VHK5p_kt7Ktybm1s2_w@mail.gmail.com>
In-Reply-To: <CADkTA4O-9_7c6iKoHP_vfDhfojqoY19VHK5p_kt7Ktybm1s2_w@mail.gmail.com>
From: Joshua Watt <jpewhacker@gmail.com>
Date: Fri, 13 Oct 2023 13:32:33 -0600
Message-ID: <CAJdd5GYtQci3+sk3J1HGL8fMvJob=KW7o6TdqABCU6G-=_j7hA@mail.gmail.com>
Subject: Re: [meta-virtualization][PATCH v2] classes/image-oci-umoci: Handle
 mutliple entrypoint arguments
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 13 Oct 2023 19:32:52 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/8364

On Fri, Oct 13, 2023 at 10:58=E2=80=AFAM Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
>
> On Fri, Oct 13, 2023 at 11:38=E2=80=AFAM Joshua Watt <JPEWhacker@gmail.co=
m> wrote:
> >
> > The entrypoint to a container is actually an array of the executable to
> > run and the arguments to pass to it. It is useful to be able to specify
> > the entire list as the entrypoint when creating containers so that
> > then entrypoint can be encoded with argument, e.g.
> >
> >     ENTRYPOINT ["/usr/bin/python3", "my-script"]
> >
> > The current way that image-oci-umoci.bbclass handles this is equivalent
> > to:
> >
> >     ENTRYPOINT ["/usr/bin/python3"]
> >     CMD ["my-script"]
> >
> > But this is undesirable as it means if the user passes arguments when
> > running the container, it will override the "my-script" argument and th=
e
> > arguments will instead get passed to the python interpreter, which may
> > not be desired.
> >
> > Instead, pass all the entry point arguments to umoci in a single
> > invocation using multiple --config.entrypoint arguments, which correctl=
y
> > make the list as described above. The entire ENTRYPOINT list will start
> > with OCI_IMAGE_ENTRYPOINT, then have OCI_IMAGE_ENRTYPOINT_ARGS split by
> > spaces concatenated after it.
> >
> > Signed-off-by: Joshua Watt <JPEWhacker@gmail.com>
> > ---
> >  classes/image-oci-umoci.inc | 8 ++++----
> >  1 file changed, 4 insertions(+), 4 deletions(-)
> >
> > diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> > index 58e4668..245dae5 100644
> > --- a/classes/image-oci-umoci.inc
> > +++ b/classes/image-oci-umoci.inc
> > @@ -99,10 +99,10 @@ IMAGE_CMD:oci() {
> >         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH}, but=
 umoci does not"
> >         bbnote "     expose variants. use sloci instead if this is impo=
rtant"
> >      fi
> > -    umoci config --image $image_name:${OCI_IMAGE_TAG} --config.entrypo=
int ${OCI_IMAGE_ENTRYPOINT}
> > -    if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> > -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd =
"${OCI_IMAGE_ENTRYPOINT_ARGS}"
> > -    fi
> > +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> > +       --config.entrypoint "${OCI_IMAGE_ENTRYPOINT}" \
> > +       ${@" ".join("--config.entrypoint %s" % s for s in d.getVar("OCI=
_IMAGE_ENTRYPOINT_ARGS").split())}
> > +
>
>
> This is super close to what I badly tried to describe. I realize I could =
have
>  just done a patch to be clear, but it was a bit late and I just
> wanted to get something out.
>
> Do you think something like the following would meet your use case :
>
> diff --git a/classes/image-oci-umoci.inc b/classes/image-oci-umoci.inc
> index 58e4668..0d6c712 100644
> --- a/classes/image-oci-umoci.inc
> +++ b/classes/image-oci-umoci.inc
> @@ -99,9 +99,10 @@ IMAGE_CMD:oci() {
>         bbnote "OCI: image subarch is set to: ${OCI_IMAGE_SUBARCH},
> but umoci does not"
>         bbnote "     expose variants. use sloci instead if this is import=
ant"
>      fi
> -    umoci config --image $image_name:${OCI_IMAGE_TAG}
> --config.entrypoint ${OCI_IMAGE_ENTRYPOINT}
> +    umoci config --image $image_name:${OCI_IMAGE_TAG} \
> +         ${@" ".join("--config.entrypoint %s" % s for s in
> d.getVar("OCI_IMAGE_ENTRYPOINT").split())}
>      if [ -n "${OCI_IMAGE_ENTRYPOINT_ARGS}" ]; then
> -       umoci config --image $image_name:${OCI_IMAGE_TAG} --config.cmd
> "${OCI_IMAGE_ENTRYPOINT_ARGS}"
> +       umoci config --image $image_name:${OCI_IMAGE_TAG} ${@"
> ".join("--config.cmd %s" % s for s in
> d.getVar("OCI_IMAGE_ENTRYPOINT_ARGS").split())}
>      fi
>
> That way you aren't forced to split your multi argument entrypoint
> over two variables, and
> we can still have arguments in that ARGS variable available to be
> clobbered on container
> start, etc.
>
> I realize this is probably where you would have started if not for
> concerns about backward compatibility, etc.
> But looking at it more, it is easier to just convert both variables to
> the repeated call to umoci. We are
> leaving the variables themselves the same with space separated
> arguments/entrypoint, so that is enough
> backward compatibility for me.

Ah, yes. That is even better.

I like how you can set both entrypoint and command as lists this way.

>
> Bruce
>
>
> >
> >      umoci config --image $image_name:${OCI_IMAGE_TAG} --author ${OCI_I=
MAGE_AUTHOR_EMAIL}
> >
> >      # make a tar version of the image direcotry
> > --
> > 2.34.1
> >
> >
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> > Links: You receive all messages sent to this group.
> > View/Reply Online (#8362): https://lists.yoctoproject.org/g/meta-virtua=
lization/message/8362
> > Mute This Topic: https://lists.yoctoproject.org/mt/101942798/1050810
> > Group Owner: meta-virtualization+owner@lists.yoctoproject.org
> > Unsubscribe: https://lists.yoctoproject.org/g/meta-virtualization/unsub=
 [bruce.ashfield@gmail.com]
> > -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II

