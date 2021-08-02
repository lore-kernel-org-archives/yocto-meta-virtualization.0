Received: from mail-ot1-f46.google.com (mail-ot1-f46.google.com [209.85.210.46])
 by mx.groups.io with SMTP id smtpd.web10.14389.1627866238948664336
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 01 Aug 2021 18:03:59 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=mFlIwwIE;
 spf=pass (domain: gmail.com, ip: 209.85.210.46, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-ot1-f46.google.com with SMTP id h63-20020a9d14450000b02904ce97efee36so5388542oth.7
        for <meta-virtualization@lists.yoctoproject.org>; Sun, 01 Aug 2021 18:03:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oQ9+4zwFhULRGsAyWeRKu+ogcwxjgb3W2zxY7ET7kaw=;
        b=mFlIwwIEJnCVpU8dP1ynG/oEAQmqjbsMWIu2IuEHzdAndQr703r/R4FJRHNqigZQpt
         q/SVVI6TjE4qLjXnGQu43aihuSB7W4aqHudwx1cwXDSGBP3S8IMj9gel1Af7I+KCD+z1
         TzMELsoESQKxgrUvRjKM4pnA0MC8TJqMRFTvy89Sh70C1V9azeDN5kx2NmBkJbRINmm4
         F+FlcWG1E/t0x0RRHITCulVHZO1ixpOuJadxIB9YpEw231DkQMp+oK/U2ZdVE1t7q4wb
         6stwX9LzVB4gVEIlzNIdLp84isehWRgIPtl9xuYCNw7HfqVNyR+kVSMvhKGJl/kqyhfL
         Xs1A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oQ9+4zwFhULRGsAyWeRKu+ogcwxjgb3W2zxY7ET7kaw=;
        b=bPGlbRqrYIWTOR5XZ7pGdJ2jj8ixP7vDNGNQz2HSDqjwf9kHod4gjrmRQhagxMBEwS
         Wx1bWdWazUpsuG9DLYEx0RLP7s0QCujoSG5lmW06HUwHx+SeVcZNSoyLGUKOCadyeC7h
         36jzcwZzL0RJGVAyH+ddb48+FpK/WSTrn6pUbdkjJ9LZjmoLvHkgyRJ0jdVAJ6dbjvrq
         etQ+8GkA7ACDULKdG+lnfewH4e71nCfo+pIeeBoaktkW7MPDxb/urn/NdT5b19PUSYcJ
         EUQX2W+5gtXCMWCv6oGW3D5kwAnxcpmsDbekzBj+xPLM62iGO8a6Pl2OupBHlb46yUX7
         deMw==
X-Gm-Message-State: AOAM532AZRj2X8HasXmTMotR1jjulUrzx5/gGbnEqxK2A9j25bpaiyRn
	hIUWBT6u7hIIcN88BqWxFdb5CQsUu4HLVevFUTo=
X-Google-Smtp-Source: ABdhPJyaSRf/zJndCBYbtlcP/LBfz63Xa+aO4q+PoDSiHm8mEM/DXA6eJEU/2Q41YYYlmMXlTMYtZ50jwjpzYuXhvak=
X-Received: by 2002:a9d:5f07:: with SMTP id f7mr9793167oti.183.1627866238280;
 Sun, 01 Aug 2021 18:03:58 -0700 (PDT)
MIME-Version: 1.0
References: <CAPoiz9zH=UK1Aj=o6rWVmF4De58hjXyZ4QBpb8N5Lus898x6Uw@mail.gmail.com>
In-Reply-To: <CAPoiz9zH=UK1Aj=o6rWVmF4De58hjXyZ4QBpb8N5Lus898x6Uw@mail.gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Sun, 1 Aug 2021 18:03:47 -0700
Message-ID: <CACMJ4GZ_fvUV_Z9z5+m5CE1Vj4xXVtD8PW0L9qUHwJ=CmwC7=Q@mail.gmail.com>
Subject: Re: [meta-virtualization] Build break with patch for "qemuboot, xen-image-minimal: enable runqemu for qemuarm64 Xen images"
To: Jon Mason <jdmason@kudzu.us>
Cc: Christopher Clark <christopher.clark@starlab.io>, Bruce Ashfield <bruce.ashfield@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Sun, Aug 1, 2021 at 8:36 AM Jon Mason <jdmason@kudzu.us> wrote:
>
> I'm building xen-image-minimal for gem5-arm64 machine (in the meta-arm
> layer) and the recent patch to add qemuarm64 support is breaking my
> builds.  The patch in question is:
>
> 19347a7c4e4c qemuboot, xen-image-minimal: enable runqemu for qemuarm64
> Xen images
>
> You can see an example of the breakage here:
> https://gitlab.com/jonmason00/meta-arm/-/jobs/1468242014

Hi Jon

I'm sorry that my patch caused trouble and thanks for sending your
report. I now understand the issue.

> The problematic line is
> diff --git a/recipes-extended/images/xen-image-minimal.bb
> b/recipes-extended/images/xen-image-minimal.bb
> index 6733801cca5f..ca6d26836c42 100644
> --- a/recipes-extended/images/xen-image-minimal.bb
> +++ b/recipes-extended/images/xen-image-minimal.bb
> @@ -31,7 +31,7 @@ XEN_PCIBACK_MODULE_x86-64 = "kernel-module-xen-pciback"
>
>  LICENSE = "MIT"
>
> -inherit core-image
> +inherit core-image qemuboot-xen-defaults qemuboot-xen-dtb
>
> Reverting this line "fixes" my problem.

Would you be able to try applying this patch instead? I believe it
will resolve the issue.

diff --git a/classes/qemuboot-xen-dtb.bbclass b/classes/qemuboot-xen-dtb.bbclass
index 08f9b02..2d37e91 100644
--- a/classes/qemuboot-xen-dtb.bbclass
+++ b/classes/qemuboot-xen-dtb.bbclass
@@ -176,7 +176,7 @@ do_write_xen_qemuboot_dtb() {
     # Not all architectures qemuboot with a device tree binary, so check
     # to see if one is needed. This allows this bbclass file to be used
     # in the same image recipe for multiple architectures.
-    if [ -n "${QB_DTB}" ] ; then
+    if [ -n "${QB_DTB}" ] && [ -n "${QB_SYSTEM_NAME}" ] ; then
         generate_xen_qemuboot_dtb
     fi
 }


> It seems odd to add qemu
> stuff for machines that don't need it.  Is it right to add qemu stuff
> to an image.bb?

I believe that it is reasonable to do so as it enables support for
testing the image (or images derived from it) even if the intended
final target is non-qemu hardware. I have been working on using this
qemu support to enable the OpenEmbedded QA framework to launch a Xen
image and execute standard and Xen-specific OEQA test cases within it,
eg. via: bitbake -c testimage xen-image-minimal
It should be a valuable capability for images that are built even for
non-qemu machine targets. You can also see within this layer that the
xvisor image recipe similarly chooses to include qemu-specific items.

thanks,

Christopher
