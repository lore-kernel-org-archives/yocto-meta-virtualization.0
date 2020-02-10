Received: from mail-ed1-f49.google.com (mail-ed1-f49.google.com [209.85.208.49])
 by mx.groups.io with SMTP id smtpd.web11.23749.1581348843863916398
 for <meta-virtualization@lists.yoctoproject.org>;
 Mon, 10 Feb 2020 07:34:04 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=o5o65RRc;
 spf=pass (domain: gmail.com, ip: 209.85.208.49, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ed1-f49.google.com with SMTP id c26so770403eds.8
        for <meta-virtualization@lists.yoctoproject.org>; Mon, 10 Feb 2020 07:34:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6Ik3C/xwBtNo63AJOE79liElZsWkMSVVdK6JTLL9h+s=;
        b=o5o65RRcW1NrDmasz90SXeKs9OZGR+y/1CT8cYe/irqd9KfQ9Y0tsHzxJ671Asg9w1
         oHpWLQA7iQVwul5L1g63ZDTg9Qb/sYEo80vVqwkFDZpP53SZMhk3pyrcdT8dmn6WTicn
         8VX0hFAJCTErDbSDciNXqKSuoFjGz0k4gOr1cyuMhZgzlH7izrcXs87QgakYI6NyLZ9M
         ChG7tsTEfIf7Vvyl5PEKM1QNVYcQNts5I+xOegalZg+SmlwnaVB0jpCsLgqnRo0Wy1E+
         NnsPcinBtOptjpKHuyBiJl7Jk7fyjSwWufEpMACls+E7MM4uMBM73Vf5mSc06SkhUDdn
         09sA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6Ik3C/xwBtNo63AJOE79liElZsWkMSVVdK6JTLL9h+s=;
        b=rfiJQ7H1K0Yd/WPtKIkLbgMKZ2iC+nwocDTt2z0wvNPHZ8Sk27I7r0/vwG/AE7n6gl
         j6p/dcWKqt3COVWwSVsQBUuFN6oM+IdqkPxNTjsSF58CEUYTKyMEYRRqf8zqsUz1E1TV
         pcDlXBSTNSU4ZCtwISUPEABumMqC2zMcI37nmRiuW3puJ/B2bPW046J5lkNY80uRTJBT
         SpXWSgvNK9T0xwNkVeDALvZgjYOtwZyeowkkDSXye+ePqdy3YQ18rTpiAMzofefrdeuY
         17l5gH8DneJErjps78LxRPd6yXLw8zX1EUUvHuk+H8i0FsYdiInu7cYSgi1pP68McWXP
         oefA==
X-Gm-Message-State: APjAAAV3mOrUkWglUVRtnUb0pzIEHYdDRuu3hW/vPkOFsXuDptV5XYdv
	rAY0G1W0zkLLUaqr9iBVwxksn48d4NzB6MUZLOI=
X-Google-Smtp-Source: APXvYqzPF3jEAaa8Oi3YPwwATK2cvaM/fYb6cr6BH49QKqS4gdyKqmK+gwdM6P8UjAIVAIWJAqZ/CjPzS7H1CSYyvAw=
X-Received: by 2002:a17:906:20c5:: with SMTP id c5mr1669469ejc.330.1581348842133;
 Mon, 10 Feb 2020 07:34:02 -0800 (PST)
MIME-Version: 1.0
References: <71AE4689-E4D8-4F9B-BE4B-22C75AD42084@arm.com> <CAM9ZRVsKVZZfXLMQNpwDC0EjNMP_uCE2wgnMwKYRFXpTLbuEUA@mail.gmail.com>
 <CADkTA4OPCO5SBEN+Ksm+uzA6bthPALaKNmwPLfcsEPtiYNMQCg@mail.gmail.com>
 <5BDA5F3A-C93B-4AD9-A50C-D48A057F0CC6@arm.com> <CADkTA4NcJt86xKT89m369KGHxWScrU=XFFzd8AK+onO5cUabLg@mail.gmail.com>
 <03340364-6665-44CC-9053-62B564ED0D85@arm.com> <15F211E71CA8CDBB.3625@lists.yoctoproject.org>
In-Reply-To: <15F211E71CA8CDBB.3625@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Mon, 10 Feb 2020 10:33:50 -0500
Message-ID: <CADkTA4OoCqA0XLt1gCjOfn2gAcE2zYNX67qMcCzL-ojAB4R1Fw@mail.gmail.com>
Subject: Re: [meta-virtualization] Layer.conf require of meta-virt-default-versions.inc
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Bertrand Marquis <Bertrand.Marquis@arm.com>, meta-virtualization@lists.yoctoproject.org
X-Groupsio-MsgNum: 5050
Content-Type: multipart/mixed; boundary="000000000000009424059e3a7818"

--000000000000009424059e3a7818
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Attached is a (lightly) tested patch, which defers the distro feature
check to the
bbclasses, versus the .conf file.

This worked on master, and hopefully it works on Zeus as well (I'll
test Zeus later today, but can't switch at the moment).

Bruce

On Mon, Feb 10, 2020 at 9:48 AM Bruce Ashfield via
Lists.Yoctoproject.Org
<bruce.ashfield=3Dgmail.com@lists.yoctoproject.org> wrote:
>
> On Mon, Feb 10, 2020 at 9:45 AM Bertrand Marquis
> <Bertrand.Marquis@arm.com> wrote:
> >
> >
> >
> > On 10 Feb 2020, at 14:35, Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
> >
> > On Mon, Feb 10, 2020 at 9:23 AM Bertrand Marquis
> > <Bertrand.Marquis@arm.com> wrote:
> >
> >
> >
> >
> > On 10 Feb 2020, at 14:17, Bruce Ashfield <bruce.ashfield@gmail.com> wr=
ote:
> >
> > On Mon, Feb 10, 2020 at 3:06 AM Paul Barker <pbarker@konsulko.com> wro=
te:
> >
> >
> > On Fri, 7 Feb 2020 at 15:42, Bertrand Marquis <bertrand.marquis@arm.co=
m> wrote:
> >
> >
> > Hi Everyone,
> >
> > Trying to design my own layer I used the example of meta-virtualizatio=
n layer configuration to try to include a file depending on a DISTRO_FEATUR=
ES value.
> >
> > After several tests, I discovered that all the values that I did defin=
ed in the included file have no effect, in fact I get the feeling that DIST=
RO_FEATURES does not contain the entries I add in local.conf when layer.con=
f is parsed.
> >
> >
> > This is correct - layer.conf in each layer is parsed before local.conf=
.
> >
> >
> > Meta-virtualization is using this system to set PREFERRED_VERSION for =
some packages but it seems that:
> > - using require without a full path does not work (maybe the require s=
hould be changed to conf/distro/include/meta-virt-default-versions.inc)
> > - even with the right path using bb.utils.contains does not work if DI=
STRO_FEATURES is set in local.conf
> >
> > Could anyone confirm or explain me where I am wrong here ?
> >
> >
> > Looking at layer.conf in meta-virtualization on the master branch, it
> > does worry me a bit that these lines might not work as expected:
> >
> >   USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> > 'virtualization', 'meta-virt-cfg', '', d)}"
> >   USER_CLASSES_append =3D " ${@bb.utils.contains('DISTRO_FEATURES',
> > 'k8s', 'meta-virt-k8s-cfg', '', d)}"
> >
> >
> > They do work as expected. See the post from Mark Hatle (to the mailing
> > list) explaining the details of why they are setup as they are.
> >
> > This is one of the only ways to ensure that something which is
> > parsed/expanded early enough can then be used in the layer conf to do
> > version pinning like this.
> >
> > That being said, what part of those lines do you think might not be wo=
rking ?
> >
> >
> > If virtualization is set in local.conf (which is the standard  would s=
ay), it will not be set when the layer.conf is parsed.
> >
> >
> > No, a distro conf is actually what is expected. With sometimes
> > temporary testing with local.conf
> >
> >
> >
> > That being said, I've run many tests with it in local.conf, and I'm
> > seeing exactly what I expect. The version files are either included,
> > or not, based on the distro feature.  I can easily show that by
> > putting a syntax error in the file, and making it either break the
> > build, or not, based on the distro feature.
> >
> > Are you not seeing the file included at all, or just that the
> > preferred versions aren't kicking in ?
> >
> >
> > In Zeus definitely not, whatever I put as error in the .inc file every=
thing goes well.
> >
> > On master that works (adding an error in one inc file creates an error=
 if virtualization is activated in local.conf)
> >
> >
> >
> > ... again, check the mailing list archives and you'll see the
> > technical explanation of how and why it is put together as it is.
> >
> >
> > I did and I agree that current behaviour in master is what is wanted. =
Was only not in my current development in Zeus.
>
> Aha. So that's the difference,
>
> I'll spin a patch for Zeus that moves the distro check to the included
> file, versus the .conf.
>
> Bruce
>
> >
> > Cheers,
> > Bertrand
> >
> >
> > Cheers,
> >
> > Bruce
> >
> > This could be solve by doing the test in the class directly (using a p=
ython function instead).
> >
> > Bertrand
> >
> >
> >
> > Bruce
> >
> >
> > Perhaps these should become unconditional appends to USER_CLASSES and
> > the DISTRO_FEATURES checks should be done inside those classes.
> >
> > Bruce, any thoughts on this one for meta-virtualization?
> >
> >
> > Here are the tests I did to end up with those conclusions:
> > - "require meta-virt-default-versions.inc=E2=80=9D directly in layer.c=
onf is ending with a bitbake error
> > So the file is not found here.
> > - =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=
=E2=80=9D build correctly
> > So the file is properly included here.
> > - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.in=
c and =E2=80=9Crequire conf/distro/include/meta-virt-default-versions.inc=
=E2=80=9D in layer.conf end up in an error
> > So the file is properly included here.
> > - adding =E2=80=9CTEST=3D" =E2=80=9C in  meta-virt-default-versions.in=
c and =E2=80=9Crequire ${@bb.utils.contains('DISTRO_FEATURES', 'virtualizat=
ion', 'meta-virt-default-versions.inc', '', d)}=E2=80=9D in layer.conf buil=
d correctly
> > So the file is not included here
> >
> > Is there a right way to achieve what is want in layer.conf ?
> >
> >
> > You need to delay parsing of your variable until after bitbake.conf is
> > parsed (which includes local.conf and other related files). The
> > simplest way to do this is to place the logic in a bbclass and add
> > this to the INHERIT variable in your layer.conf. The classes in
> > INHERIT are picked up as if they were at the start of each recipe that
> > is parsed.
> >
> > Thanks,
> > Paul
> >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
> >
> >
> > --
> > - Thou shalt not follow the NULL pointer, for chaos and madness await
> > thee at its end
> > - "Use the force Harry" - Gandalf, Star Trek II
> >
> >
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
>=20



--=20
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--000000000000009424059e3a7818
Content-Type: application/octet-stream; 
	name="0001-conf-defer-DISTRO_FEATURE-check-to-bbclass-processin.patch"
Content-Disposition: attachment; 
	filename="0001-conf-defer-DISTRO_FEATURE-check-to-bbclass-processin.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_k6gm9gwd0>
X-Attachment-Id: f_k6gm9gwd0

RnJvbSAzYTdkNDQ2ZmE5NDc4N2VkYTBiY2MyZjM3NTllMDdkYjViZGE2YjJmIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPgpEYXRlOiBNb24sIDEwIEZlYiAyMDIwIDEwOjI3OjU2IC0wNTAwClN1YmplY3Q6IFtQQVRD
SF0gY29uZjogZGVmZXIgRElTVFJPX0ZFQVRVUkUgY2hlY2sgdG8gYmJjbGFzcyBwcm9jZXNzaW5n
CgpXZSB3ZXJlIHVzaW5nIFVTRVJfQ0xBU1MgbG9hZGluZyB0byBhbGxvdyBjb25kaXRpb25hbCBj
aGVja2luZwpvbiBESVNUUk9fRkVBVFVSRVMsIHdoaWNoIHRyaWdnZXJlZCBkaXN0cm8gZmVhdHVy
ZSBzcGVjaWZpYyB2ZXJzaW9uCnBpbm5pbmcuCgpJdCB3YXMgZm91bmQgdGhhdCBESVNUUk9fRkVB
VFVSRVMgc2V0IGluIGxvY2FsLmNvbmYgaXMgbm90CmNvbnNpc3RlbnRseSBhdmFpbGFibGUgYXQg
bGF5ZXIuY29uZiBwYXJzZSB0aW1lLCBoZW5jZSBvdXIgY2hlY2tzCndlcmUgbm90IGFsd2F5cyB3
b3JraW5nIGFzIGV4cGVjdGVkIChpLmUuIHRoZSB2ZXJzaW9uIGZpbGVzIGFyZQpub3QgaW5jbHVk
ZWQpLgoKSWYgd2UgbW92ZSB0aGUgRElTVFJPX0ZFQVRVUkUgY2hlY2sgdG8gdGhlIGJiY2xhc3Nl
cywgYW5kIHVzZSBpdAp0byB0cmlnZ2VyIHRoZSBpbmNsdWRlLCB3ZSBzaG91bGQgaGF2ZSBhIGNv
bnNpc3RlbnQgc2V0IG9mIHZhcmlhYmxlCnJlc29sdXRpb24gYW5kIGNvbnNpc3RlbnQgYmVoYXZp
b3VyLgoKU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQgPGJydWNlLmFzaGZpZWxkQGdtYWls
LmNvbT4KLS0tCiBjbGFzc2VzL21ldGEtdmlydC1jZmcuYmJjbGFzcyAgICAgfCAyICstCiBjbGFz
c2VzL21ldGEtdmlydC1rOHMtY2ZnLmJiY2xhc3MgfCAyICstCiBjb25mL2xheWVyLmNvbmYgICAg
ICAgICAgICAgICAgICAgfCA0ICsrLS0KIDMgZmlsZXMgY2hhbmdlZCwgNCBpbnNlcnRpb25zKCsp
LCA0IGRlbGV0aW9ucygtKQoKZGlmZiAtLWdpdCBhL2NsYXNzZXMvbWV0YS12aXJ0LWNmZy5iYmNs
YXNzIGIvY2xhc3Nlcy9tZXRhLXZpcnQtY2ZnLmJiY2xhc3MKaW5kZXggYmY2M2EwNi4uYTIwZjlm
ZSAxMDA2NDQKLS0tIGEvY2xhc3Nlcy9tZXRhLXZpcnQtY2ZnLmJiY2xhc3MKKysrIGIvY2xhc3Nl
cy9tZXRhLXZpcnQtY2ZnLmJiY2xhc3MKQEAgLTMsNCArMyw0IEBACiAjIGxheWVyLmNvbmYgbG9h
ZCB0aW1lLCB3ZSBkZWxheSB1c2luZyBhIHNwZWNpYWwgYmJjbGFzcyB0aGF0IHNpbXBseSBpbmNs
dWRlcwogIyB0aGUgTUVUQV9WSVJUX0NPTkZJR19QQVRIIGZpbGUuCiAKLWluY2x1ZGUgJHtNRVRB
X1ZJUlRfQ09ORklHX1BBVEh9ClwgTm8gbmV3bGluZSBhdCBlbmQgb2YgZmlsZQoraW5jbHVkZSAk
e0BiYi51dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ3ZpcnR1YWxpemF0aW9uJywg
JyR7TUVUQV9WSVJUX0NPTkZJR19QQVRIfScsICcnLCBkKX0KZGlmZiAtLWdpdCBhL2NsYXNzZXMv
bWV0YS12aXJ0LWs4cy1jZmcuYmJjbGFzcyBiL2NsYXNzZXMvbWV0YS12aXJ0LWs4cy1jZmcuYmJj
bGFzcwppbmRleCAxYmUwYTVjLi5mMWQ3ZjgxIDEwMDY0NAotLS0gYS9jbGFzc2VzL21ldGEtdmly
dC1rOHMtY2ZnLmJiY2xhc3MKKysrIGIvY2xhc3Nlcy9tZXRhLXZpcnQtazhzLWNmZy5iYmNsYXNz
CkBAIC0zLDQgKzMsNCBAQAogIyBsYXllci5jb25mIGxvYWQgdGltZSwgd2UgZGVsYXkgdXNpbmcg
YSBzcGVjaWFsIGJiY2xhc3MgdGhhdCBzaW1wbHkgaW5jbHVkZXMKICMgdGhlIEs4U19DT05GSUdf
UEFUSCBmaWxlLgogCi1pbmNsdWRlICR7SzhTX0NPTkZJR19QQVRIfQoraW5jbHVkZSAke0BiYi51
dGlscy5jb250YWlucygnRElTVFJPX0ZFQVRVUkVTJywgJ2s4cycsICcke0s4U19DT05GSUdfUEFU
SH0nLCAnJywgZCl9CmRpZmYgLS1naXQgYS9jb25mL2xheWVyLmNvbmYgYi9jb25mL2xheWVyLmNv
bmYKaW5kZXggZDBhN2VhZC4uOTIyY2IwZCAxMDA2NDQKLS0tIGEvY29uZi9sYXllci5jb25mCisr
KyBiL2NvbmYvbGF5ZXIuY29uZgpAQCAtNDYsNSArNDYsNSBAQCBJTkhFUklUICs9ICJzYW5pdHkt
bWV0YS12aXJ0IgogIyB0aGUgTUVUQV9WSVJUX0NPTkZJR19QQVRIIGZpbGUsIGFuZCBsaWtld2lz
ZSBmb3IgdGhlIGs4cyBjb25maWdzCiBNRVRBX1ZJUlRfQ09ORklHX1BBVEggPSAiJHtMQVlFUkRJ
Un0vY29uZi9kaXN0cm8vaW5jbHVkZS9tZXRhLXZpcnQtZGVmYXVsdC12ZXJzaW9ucy5pbmMiCiBL
OFNfQ09ORklHX1BBVEggPSAiJHtMQVlFUkRJUn0vY29uZi9kaXN0cm8vaW5jbHVkZS9rOHMtdmVy
c2lvbnMuaW5jIgotVVNFUl9DTEFTU0VTX2FwcGVuZCA9ICIgJHtAYmIudXRpbHMuY29udGFpbnMo
J0RJU1RST19GRUFUVVJFUycsICd2aXJ0dWFsaXphdGlvbicsICdtZXRhLXZpcnQtY2ZnJywgJycs
IGQpfSIKLVVTRVJfQ0xBU1NFU19hcHBlbmQgPSAiICR7QGJiLnV0aWxzLmNvbnRhaW5zKCdESVNU
Uk9fRkVBVFVSRVMnLCAnazhzJywgJ21ldGEtdmlydC1rOHMtY2ZnJywgJycsIGQpfSIKK1VTRVJf
Q0xBU1NFU19hcHBlbmQgPSAiIG1ldGEtdmlydC1jZmciCitVU0VSX0NMQVNTRVNfYXBwZW5kID0g
IiBtZXRhLXZpcnQtazhzLWNmZyIKLS0gCjIuMTkuMQoK

--000000000000009424059e3a7818--
