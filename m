Received: from mail-lj1-f195.google.com (mail-lj1-f195.google.com [209.85.208.195])
 by mx.groups.io with SMTP id smtpd.web11.5559.1579157863019639437
 for <meta-virtualization@lists.yoctoproject.org>;
 Wed, 15 Jan 2020 22:57:43 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=giqcXj3b;
 spf=pass (domain: gmail.com, ip: 209.85.208.195, mailfrom: christopher.w.clark@gmail.com)
Received: by mail-lj1-f195.google.com with SMTP id m26so21335893ljc.13
        for <meta-virtualization@lists.yoctoproject.org>; Wed, 15 Jan 2020 22:57:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=eMm4SPmML++hYMh2bUVDDa46vfvCNIdr24ipczRUrSs=;
        b=giqcXj3bGbufRhwYG9S48wT2PNO/0xzQ+uH+0i+qkxej7yWg01xccF9Z+STgJAtAZS
         N57kWllt/GGZZ9NaDmfojiXu2N1aJGdZldL8hg/1JTy1Cv6s+fIZfZDECrlQxBPy2J0I
         ODg7KgtF5Xgalr5KZBO3ukjt7JvgJ08ES8Rj+5SRcy3OTTaAP37L2BD+jgJAy30paUSA
         h6+HtF9YB/WU0njkWUnenXT4NXaZwPZsHrAiE28fIA0aznOOEkWT6t0LbjsDzKQD9brJ
         temHIBFr1NpWU4CyG/b/+1PcbdMOXazPTuezP3ohxnqVQc9vLbIdWn9KJqF091vpO4qd
         gULw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=eMm4SPmML++hYMh2bUVDDa46vfvCNIdr24ipczRUrSs=;
        b=SAoWVSIvMft1ZJeBcg9x61Rz9v6/XD+w6b7hstyNGev2918fVpsYiNHR/mmhj+mdN2
         X4qjmhwVKSusECb/I+GotLfQvwTHtxrCumDA8Nmf/VXgjUwwt3V4ez2GBHDYcdJ4UQnb
         T0u1cbVz5PYEYs/j9ADahO+z4dIUmXFAComuhK6WFMOP/Iv0WqDWicyrxZ/9b8f71hAd
         VO8fy+hpFYn3gNW8WCy2KLnSDYvcQRyBWwSBfDSwvkJPdKEz2SSB0L86Umwhq1gakTSg
         rvdT8cqfPRHRERSg7eWdPTTwXctUR74RvzH5uQ0NkG6MQFslRMRaSNMpLou09vL0q11a
         2KsQ==
X-Gm-Message-State: APjAAAXKvtXUejqcbc0Q9tCpcxSrrufWVXM7IYChfHZIVlgQ7ydkL+1p
	2asJ3gaYIK8l0rEekN4bZxQYHNogWQ8SiFYZvVw=
X-Google-Smtp-Source: APXvYqzdJ7swInw0brjgYS4QuhbSKNIjkFsVc8MuYwCcAFBlJEXiINflp1AHrmXgJnrAN3zOIiX7JlYtslpor2tV91o=
X-Received: by 2002:a2e:e12:: with SMTP id 18mr1338348ljo.123.1579157861029;
 Wed, 15 Jan 2020 22:57:41 -0800 (PST)
MIME-Version: 1.0
References: <20200113154742.15509-1-brendank310@gmail.com>
In-Reply-To: <20200113154742.15509-1-brendank310@gmail.com>
From: "Christopher Clark" <christopher.w.clark@gmail.com>
Date: Wed, 15 Jan 2020 22:57:29 -0800
Message-ID: <CACMJ4GZUq-hrYamCjJ-_2GQJYU2qTA2HxkY51kMR=Kk5VrE5bA@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH 0/3] xen: uprev to 4.13.0
To: Brendan Kerrigan <brendank310@gmail.com>
Cc: meta-virtualization@lists.yoctoproject.org, 
	Brendan Kerrigan <kerriganb@ainfosec.com>
Content-Type: text/plain; charset="UTF-8"

On Mon, Jan 13, 2020 at 8:15 AM Brendan Kerrigan <brendank310@gmail.com> wrote:
>
> From: Brendan Kerrigan <kerriganb@ainfosec.com>
>
> Uprev xen to 4.13.0 release

Thanks, Brendan -- I'm working on a review for this series now.

Christopher

>
> Brendan Kerrigan (3):
>   xen: add flag to ignore warning "address-of-packed-member"
>   xen: add package for xen-ucode
>   xen: upgrade to 4.13.0
>
>  ...01-python-pygrub-pass-DISTUTILS-xen.4.13.patch} |  3 +++
>  recipes-extended/xen/xen.inc                       |  8 ++++++++
>  recipes-extended/xen/xen_4.12.0.bb                 | 12 ------------
>  recipes-extended/xen/xen_4.13.0.bb                 | 14 ++++++++++++++
>  4 files changed, 25 insertions(+), 12 deletions(-)
>  rename recipes-extended/xen/files/{0001-python-pygrub-pass-DISTUTILS-xen.4.12.patch => 0001-python-pygrub-pass-DISTUTILS-xen.4.13.patch} (96%)
>  delete mode 100644 recipes-extended/xen/xen_4.12.0.bb
>  create mode 100644 recipes-extended/xen/xen_4.13.0.bb
>
> --
> 2.20.1
>
> 
