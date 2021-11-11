Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web08.311.1636642015736618610
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 11 Nov 2021 06:46:56 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Te0gbA+s;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id r12so25121366edt.6
        for <meta-virtualization@lists.yoctoproject.org>; Thu, 11 Nov 2021 06:46:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ADUCMlp4W+ZQdb/28lXzlRSaYv2Hh0NPYqMuI7wBP7w=;
        b=Te0gbA+s/bI9ypcYqCVT1Js62JzfPOgJiDKLTf5yemCN2CBuWt28F9YSs4uHKpxn+9
         NaGOoXlQnXw7xNSxwD/D67FUEa3i7WeyidQoYB12oCd69j3UzdEjySg/fmfctTz6XA5j
         YUXtplF6DrdLwin3e9bzPptLvSoYKvSdzXWrNvZCM9wZYflFYyeMrMjlSuDFcg//GyFG
         fl921Bpo/g0TfIQiPUnRFd4MboN6M9h7gjXGMgy5P3Bu/KiykBRPwWDQpHOEOxAtyBnj
         ryDzGqlGYY9WCnUN7NyI6syoVJO0FblHZx2mvRVeCeJ+8mp0J2QsYqCMyFOq1SpHrDI0
         bqEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ADUCMlp4W+ZQdb/28lXzlRSaYv2Hh0NPYqMuI7wBP7w=;
        b=fDufYXHZ1FETGiuLMvsFAaC92jdHj2W8yclbGuwNcvbi9D8i0t7unBPJ2es02gDpya
         aH7K+nkAgGeHEB3aJhbngRg/ZAXkjHGncUUu/UW60q0YnCmg5tERftjqEeR/TvvAZ7zm
         UnuJ7rX3bS0mYPD8blepN/XE/LwIQTG7JbIMJRDGTKwttC7AGvv+Ru6AVZnBiPZFCs5I
         ujJCiK1K8m+OJep+ExVxexQVVjv/mytXAnTSlwyrqPO5RyZ94cH3GpMLu6TCWMMfCRWE
         n5+9CVX4FAEl1HibaqGQ+OtWaiD3XQGjY5ywWXiILGOUiRtE3Xc/MVNJDieqtO1blSK6
         uZpg==
X-Gm-Message-State: AOAM532G4cx3lqn+Ax6E+aN33uk+5IJFHcV6xxMm2ey+FCSTjTXUvkha
	JqO4cTbF3pOX5za0/nfZmVVs/mftfLU5gnLEIzg=
X-Google-Smtp-Source: ABdhPJzgZPMEsMRB5HSW395tjBYqhUYZYXqgkpinBTsJQ0yyHIQZaUq2rYxnQGja8akwubhp8l++jl3sWD52sRnl3Gc=
X-Received: by 2002:a17:906:48cd:: with SMTP id d13mr9879867ejt.35.1636642013800;
 Thu, 11 Nov 2021 06:46:53 -0800 (PST)
MIME-Version: 1.0
References: <20211111135719.2503140-1-ross.burton@arm.com>
In-Reply-To: <20211111135719.2503140-1-ross.burton@arm.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Thu, 11 Nov 2021 09:46:42 -0500
Message-ID: <CADkTA4OAifUAUFm=KXptf-sOQjX2XG3o69PAEy7FYyoK26t9Cg@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] python3-dtc: port to Python 3.10
To: Ross Burton <ross@burtonini.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

My xen-image-minimal build worked with this change, so I've grabbed it and
pushed it to master.

Bruce

On Thu, Nov 11, 2021 at 8:57 AM Ross Burton <ross@burtonini.com> wrote:
>
> Signed-off-by: Ross Burton <ross.burton@arm.com>
> ---
>  recipes-kernel/dtc/files/ssize.patch    | 35 +++++++++++++++++++++++++
>  recipes-kernel/dtc/python3-dtc_1.6.1.bb |  3 ++-
>  2 files changed, 37 insertions(+), 1 deletion(-)
>  create mode 100644 recipes-kernel/dtc/files/ssize.patch
>
> diff --git a/recipes-kernel/dtc/files/ssize.patch b/recipes-kernel/dtc/files/ssize.patch
> new file mode 100644
> index 0000000..3156896
> --- /dev/null
> +++ b/recipes-kernel/dtc/files/ssize.patch
> @@ -0,0 +1,35 @@
> +Python 3.10 has made it mandatory that the 'string+length` formats use ssize_t
> +instead of int, so define the magic symbol and upcast the ints from the libfdt
> +API to ssize_t.
> +
> +Upstream-Status: Pending
> +Signed-off-by: Ross Burton <ross.burton@arm.com>
> +
> +diff --git a/pylibfdt/libfdt.i b/pylibfdt/libfdt.i
> +index 51ee801..075ef70 100644
> +--- a/pylibfdt/libfdt.i
> ++++ b/pylibfdt/libfdt.i
> +@@ -1044,9 +1044,9 @@ typedef uint32_t fdt32_t;
> +               $result = Py_None;
> +       else
> +         %#if PY_VERSION_HEX >= 0x03000000
> +-            $result = Py_BuildValue("y#", $1, *arg4);
> ++            $result = Py_BuildValue("y#", $1, (Py_ssize_t)*arg4);
> +         %#else
> +-            $result = Py_BuildValue("s#", $1, *arg4);
> ++            $result = Py_BuildValue("s#", $1, (Py_ssize_t)*arg4);
> +         %#endif
> + }
> +
> +diff --git a/pylibfdt/setup.py b/pylibfdt/setup.py
> +index ef40f15..88ff7d1 100755
> +--- a/pylibfdt/setup.py
> ++++ b/pylibfdt/setup.py
> +@@ -42,6 +42,7 @@ def get_version():
> + libfdt_module = Extension(
> +     '_libfdt',
> +     sources=[os.path.join(srcdir, 'libfdt.i')],
> ++    define_macros=[('PY_SSIZE_T_CLEAN', None)],
> +     include_dirs=[os.path.join(srcdir, '../libfdt')],
> +     libraries=['fdt'],
> +     library_dirs=[os.path.join(top_builddir, 'libfdt')],
> diff --git a/recipes-kernel/dtc/python3-dtc_1.6.1.bb b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> index 293c8d3..d7d45a4 100644
> --- a/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> +++ b/recipes-kernel/dtc/python3-dtc_1.6.1.bb
> @@ -6,7 +6,8 @@ LICENSE = "GPLv2 | BSD-2-Clause"
>
>  DEPENDS = "flex-native bison-native swig-native libyaml dtc"
>
> -SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master"
> +SRC_URI = "git://git.kernel.org/pub/scm/utils/dtc/dtc.git;branch=master \
> +           file://ssize.patch"
>
>  UPSTREAM_CHECK_GITTAGREGEX = "v(?P<pver>\d+(\.\d+)+)"
>
> --
> 2.25.1
>
>
> 
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
