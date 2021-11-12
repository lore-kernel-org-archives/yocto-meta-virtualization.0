Received: from mail-ed1-f54.google.com (mail-ed1-f54.google.com [209.85.208.54])
 by mx.groups.io with SMTP id smtpd.web12.17257.1636731417168985752
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 12 Nov 2021 07:36:57 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20210112 header.b=Y+QTtlB3;
 spf=pass (domain: gmail.com, ip: 209.85.208.54, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f54.google.com with SMTP id r12so39258421edt.6
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 12 Nov 2021 07:36:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JiaUZ/ebLDJCeZRHaD2pmIcLGzrOIdIaNUzTc9pMf6c=;
        b=Y+QTtlB3VYSeCXVLm7siY7R56YizzzGkxi9PKRjbSmJEi2TEGurSjAdEKJuGJNSVad
         68XX+63bhNJrlllcdc2kY2FhEAxWMFPbmHUXnDP7bqTiTOLUTh54FZfDNnX+5xnd3hWG
         37TxANJRTCJCT+eBdx32KW2V4JNc7FYZIdHcwd8MQYcz4MFpg4X7HwZGYalvFnan5rxp
         yGek7qOdZuQVXZBesGZOf1ZPcVg7tQc+V7WAeSVwfHYRquI1qlnDkZ6yOAem3jig1LNg
         7bQvtIzfrlHShVXM3t2OIE8WjMVDXYcErpcRJ74/TtLnNm6wPn1nfWLYhJC+LjbWDsqQ
         ZI0Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JiaUZ/ebLDJCeZRHaD2pmIcLGzrOIdIaNUzTc9pMf6c=;
        b=m2kMJCXHQqkXrUHE0Z3/ROBCM9wZXMuBUsuaX0X3g7LkVDiUBctrQXBpxLEDudU6E3
         Kfe8NJPs/E/ROlCW6AHMKHimUlINbcfqWpd/EGAq3jmgKV9849gwNwweaHIGYBWRPhaz
         l2Z2n3sxDmhbs8vrzkCAux5xxOwO0Ar+G5vqgErPywSUV2u0AQcdo0APG8DC7Bb64k9V
         Oibc7PIfv2aKmG2dvE52eKUq0Ch4tuYoAGWjqI9TWwiSnO8qNEw0owKgmSqq7c4EVWhS
         FXdmsUr0eBVsWw6e6dZu3fcOIKLnkwEWoQ430mdz20AOlxcBJK+nhd9PpZbh0hQsJkSw
         qS+g==
X-Gm-Message-State: AOAM531+bvn0hXMfKxaO7N75Hm9lMubnVTwkWypMDgG++vqfBiF9q8PV
	Qda8ynd+XVsgTN8I2qfd7vZWB4gq0cEAVu8nhyo=
X-Google-Smtp-Source: ABdhPJxCb/K2Ty1ML9qNGJ4RjxG7Lx/FEQwVj58FtI+Q+o5vHoIxlgPl3zu+P/kPprkOm7Na2o6qkqvNoAhJTBjCeqA=
X-Received: by 2002:a50:c31c:: with SMTP id a28mr6740472edb.4.1636731415483;
 Fri, 12 Nov 2021 07:36:55 -0800 (PST)
MIME-Version: 1.0
References: <20211112032335.5922-1-kai.kang@windriver.com> <CADkTA4O6W8QHsSrsWuc-_CM8yBo=QgcVBBynOj-92UbWwftNAA@mail.gmail.com>
 <bbb475b9-d49d-576f-5a70-8dfc462582c6@windriver.com>
In-Reply-To: <bbb475b9-d49d-576f-5a70-8dfc462582c6@windriver.com>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 12 Nov 2021 10:36:44 -0500
Message-ID: <CADkTA4NCXky4K_hm6Bx4rg2Ue+83jxknxKuAsqVwVWyk3j_S2A@mail.gmail.com>
Subject: Re: [meta-virtualization] [PATCH] libvirt: do not install /var/log for target
To: Kai <kai.kang@windriver.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"

On Thu, Nov 11, 2021 at 11:49 PM Kai <kai.kang@windriver.com> wrote:
>
> On 11/12/21 12:03 PM, Bruce Ashfield wrote:
> > On Thu, Nov 11, 2021 at 10:23 PM kai <kai.kang@windriver.com> wrote:
> >> From: Kai Kang <kai.kang@windriver.com>
> >>
> >> /var/log is normally a link to /var/volatile/log and /var/volatile is a tmpfs
> >> mount. So anything created in /var/log will not be available when the tmpfs is
> >> mounted.
> >>
> >> Not install /var/log to avoid 'empty-dirs' qa issue:
> >>
> >> | ERROR: libvirt-7.2.0-r0 do_package_qa: QA Issue: libvirt installs files in
> >>    /var/volatile, but it is expected to be empty [empty-dirs]
> >>
> >> Signed-off-by: Kai Kang <kai.kang@windriver.com>
> >> ---
> >>   recipes-extended/libvirt/libvirt_7.2.0.bb | 4 ++++
> >>   1 file changed, 4 insertions(+)
> >>
> >> diff --git a/recipes-extended/libvirt/libvirt_7.2.0.bb b/recipes-extended/libvirt/libvirt_7.2.0.bb
> >> index b7f8383a..b49bd11a 100644
> >> --- a/recipes-extended/libvirt/libvirt_7.2.0.bb
> >> +++ b/recipes-extended/libvirt/libvirt_7.2.0.bb
> >> @@ -232,6 +232,10 @@ do_install:append() {
> >>          echo "d root root 0755 /run/libvirt/qemu none" \
> >>               >> ${D}${sysconfdir}/default/volatiles/99_libvirt
> >>
> >> +       # /var/log is normally a link to /var/volatile/log
> >> +       # and /var/volatile is a tmpfs mount which should be clean.
> >> +       rm -rf ${D}${localstatedir}/log
> > We should be preventing the install from happening at all, not
> > deleting it after the fact.
> >
> > If libvirt thinks something needs to be in the directory, then we
> > should be looking into why it does exactly that.
>
> OK.I'll figure out.

I poked around at this myself, and then asked Ross to help me out .. I
assumed it was meson doing this, and he pointed out the right
meson.build files to me.

I'm trying to figure out how to balance some non volatile use cases,
with this new QA check. If we universally delete those files, then
those cases are broken.

I'm leaning towards leaving the directories in place, and just
inhibiting the QA check.

Bruce

>
> Regards,
> Kai
>
> >
> > Bruce
> >
> >> +
> >>          # Manually set permissions and ownership to match polkit recipe
> >>          if ${@bb.utils.contains('PACKAGECONFIG', 'polkit', 'true', 'false', d)}; then
> >>                  install -d -m 0700 ${D}/${datadir}/polkit-1/rules.d
> >> --
> >> 2.33.0
> >>
> >>
> >> 
> >>
> >
>
> --
> Kai Kang
> Wind River Linux
>


-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II
