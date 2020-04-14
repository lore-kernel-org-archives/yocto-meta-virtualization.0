Received: from mail-ot1-f65.google.com (mail-ot1-f65.google.com [209.85.210.65])
 by mx.groups.io with SMTP id smtpd.web10.1085.1586890961642610256
 for <meta-virtualization@lists.yoctoproject.org>;
 Tue, 14 Apr 2020 12:02:41 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: gmail.com, ip: 209.85.210.65, mailfrom: asselsm@gmail.com)
Received: by mail-ot1-f65.google.com with SMTP id b13so817997oti.3
        for <meta-virtualization@lists.yoctoproject.org>; Tue, 14 Apr 2020 12:02:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:reply-to
         :from:date:message-id:subject:to:cc:content-transfer-encoding;
        bh=bCJ9xhfpoUSN5LqYgOIjgEN4t4NsJj0MwngA8lOLE4Q=;
        b=cOn7mVXGrHrLxy8Sg1X1m9sw+kTUD9KivEU5KZx/qAyzUnqBPfRSa6yyqsJhjHzcn+
         wTuGssC2uW4TjW2Aav7Z4xjvz6YLhRShZTbmi4I7b9zbbbCmcIjsU10kDtcfve9dhU/s
         uErRjxje13luxZEMs/XYeEjUMah7Z0zpBKgORVM2IsTUPCZ8cYy0cfO0IvF/XBjxP8EW
         D8RlJkknu0oc6p7Z5vqfxSg7YZGqlVIfxWzCoumuIL5Rre/Konr0vfwLvvnYVl8Xj1yL
         D/L4bGU8fChVX/5y2G/0IrSqB44eFzVAoOXIJBCGILBSagbtiYptiR5FfK/allnmwICw
         DC8g==
X-Gm-Message-State: AGi0PuavOe7zKIBEbANK5YWb0L9QhxX+SPQpGCp7JhkYP5erNdMXTzJl
	jkcE/AF0y3v9o51WRsB6s7yozw5F43vHNLIyN1x3YA==
X-Google-Smtp-Source: APiQypLY+x1K/AYqlExkZpGus+JNTFrTE7Cmf1HB0Qz7lZfRAppW0rucJqRPg26Yktp7K3788Wxvqh7H+SHgGM3oZ8k=
X-Received: by 2002:a9d:1ee5:: with SMTP id n92mr19300107otn.176.1586890960712;
 Tue, 14 Apr 2020 12:02:40 -0700 (PDT)
MIME-Version: 1.0
References: <1728619179.807474.1586271464336.JavaMail.zimbra@savoirfairelinux.com>
In-Reply-To: <1728619179.807474.1586271464336.JavaMail.zimbra@savoirfairelinux.com>
Reply-To: mark.asselstine@windriver.com
From: "Mark Asselstine" <asselsm@gmail.com>
Date: Tue, 14 Apr 2020 15:02:29 -0400
Message-ID: <CAPuovEKCBbp5a58z4S80VN3HNLbz_jMNwKdVLoCs=FJurSaypQ@mail.gmail.com>
Subject: Re: [meta-virtualization] Openvswitch 2.13 and python3
To: =?UTF-8?Q?=C3=89loi_Bail?= <eloi.bail@savoirfairelinux.com>
Cc: meta-virtualization@lists.yoctoproject.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Apr 7, 2020 at 10:57 AM =C3=89loi Bail
<eloi.bail@savoirfairelinux.com> wrote:
>
> Hi guys,
>
> I am integrating ovs/dpdk on Yocto Zeus.
> As I am using a custom Linux Kernel 4.19, I can't use ovs 2.11 and used =
the mainline version.
>
> FYI I struggled with EXTRA_OECONF to point to my Linux Kernel as mention=
ned in Openvswitch recipe.
> EXTRA_OECONF_append_pn-openvswitch  needs to be used in distro instead o=
f EXTRA_OECONF_pn-openvswitch +=3D
>
> Now my ovs/dpdk is correctly installed on my Yocto image.
>
> However, ovs utilities seem to have wrong shebang (#! python3). The sheb=
ang is based on PYTHON3 variable. For instance: https://github.com/openvswi=
tch/ovs/blob/master/utilities/ovs-test.in#L1
> PYTHON3 variable is provided in EXTRA_OECONF from openvswitch.inc:
>
> EXTRA_OECONF +=3D "\
> PYTHON=3Dpython3 \
> PYTHON3=3Dpython3 \
> PERL=3D${bindir}/perl \
> "
>
> Did you encounter this issue ?
>
> Also, OVS utilities - including test tools - still use python2 syntax bu=
t Openvswitch recipe RDEPEND on python3 only. I don't know if it is a known=
 issue.
> I know that some recent work on python3 migration was done by ovs team b=
ut AFAIK, utilities scripts would require some work.
> I will give a try to migrate those scripts with 2to3 tool.

We switched to use Python3 exclusively with OVS for quite a while now.
With the Yocto Project being mostly used in embedded environments size
was the driving factor, having py2 and py3 present was not desirable.
With Python2 being EOL'd at this point I suspect the upstream OVS
community will soon remove any traces of python2 from the project.
There is no value in spending any time on py2 with OVS at this point.
The package will build and operate just fine as it is.

Mark

>
> Please do not hesitate to contact me if you need some clarification.
>
> BR,
>
> Eloi
>
>
>
>=20
