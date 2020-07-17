Received: from mail-ej1-f42.google.com (mail-ej1-f42.google.com [209.85.218.42])
 by mx.groups.io with SMTP id smtpd.web11.2372.1595012719186906022
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 17 Jul 2020 12:05:19 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@gmail.com header.s=20161025 header.b=qmbbLVt3;
 spf=pass (domain: gmail.com, ip: 209.85.218.42, mailfrom: bruce.ashfield@gmail.com)
Received: by mail-ej1-f42.google.com with SMTP id a1so11910384ejg.12
        for <meta-virtualization@lists.yoctoproject.org>; Fri, 17 Jul 2020 12:05:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=AA30sWL8/t73VkGWR8If9b0DMBMZ8GIkz7n/1hb0wBs=;
        b=qmbbLVt3Ajwt02D9EKXkY8ezIqZ+XPm2f4u8PmZDLj/D5qBuvdXfwranR1ZJoBJcmM
         oeyZMr+Ht/e/b8ctr3Kf8TBS3m+e6sYFYkhka7TTG/Z+6MAgBqafugKaTAGusH6xGl3n
         CQjzw4sFmV3KNHbin7lFxV5yX6WxBHUplZr85AoB/fllLsAXdrXkaRdIOxbVjQTM2LN4
         lnMsjOdDP/bS1S5myzjLYr7TjokoYmdNeiaFOPNREN6tQqdxm4criJIaM2ynFwyPUZYQ
         v6ICdEbYTS9G9hB/Na7jgSffhAh9T7QAP/VS0u8UxuovBgYLoaEmG0MhRPtJ8Y6a3CeV
         GDtg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=AA30sWL8/t73VkGWR8If9b0DMBMZ8GIkz7n/1hb0wBs=;
        b=bDsZWgT/ua8zXue64EHHUY0ITCo4ol8S9PAbwJJY3buY8rq/s93pXR6EkCtqZgZvYJ
         hN+52Er4150NWtRZYcn7LvViItjbwf8ysgF4YkAa674B+ysyfGRawEEQmUQCkPoJBPWp
         FWVlHOkoz9UHSg4l4FHIBGGSUZgLvF45WLKV3wfNk+o40ty6gJXwJ6vTuSKCoMQ7Rtas
         a0N66qdbQpS+Hm78Muft/uC4Sa3PNvhmlmV7ZWizRuDzjbHwLUAtPMbeJGT9RqzMxsFJ
         eRqiG9/mduf0Iddy1t3d8wlpjMiJblhCPm3yLSp4y4+twZ0FbnK2JukhbqslEGgcotAh
         ATBw==
X-Gm-Message-State: AOAM531rHA8C6XXniQPzR5qiKYIXtI/EhnwErmthespEvshCRRO7OlXh
	ilzsDbvJwOiWGqb1dGLaMETKYdidoCYAM+J6Fz0=
X-Google-Smtp-Source: ABdhPJw25IB3gMf5W1us0bBuubExulSJIv5lhvusslmErTaSoCDb9tUIgFYdYTRqXwK/jIC4ExOEYQ+7vcg/9n58us4=
X-Received: by 2002:a17:906:899:: with SMTP id n25mr9400601eje.298.1595012717498;
 Fri, 17 Jul 2020 12:05:17 -0700 (PDT)
MIME-Version: 1.0
References: <7Rna.1595008592154117129.JcM3@lists.yoctoproject.org> <16229DB323912ECB.24900@lists.yoctoproject.org>
In-Reply-To: <16229DB323912ECB.24900@lists.yoctoproject.org>
From: "Bruce Ashfield" <bruce.ashfield@gmail.com>
Date: Fri, 17 Jul 2020 15:05:06 -0400
Message-ID: <CADkTA4MkH_MXMBX3aKXua3YF=kV=CMJ+LxT8FhPYs_LpZ35kBA@mail.gmail.com>
Subject: Re: [meta-virtualization] image-oci.bbclass creates faulty arm/variant entry in index.json
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: Robert Berger <robert.berger.yocto.user@gmail.com>, 
	meta-virtualization@lists.yoctoproject.org
X-Groupsio-MsgNum: 5584
Content-Type: multipart/mixed; boundary="00000000000070671a05aaa7d677"

--00000000000070671a05aaa7d677
Content-Type: text/plain; charset="UTF-8"

Attached is the fix.

It is lightly tested and did the right thing in my unit testing. I'll
push it early next week, if it works for you as well.

Bruce

On Fri, Jul 17, 2020 at 2:30 PM Bruce Ashfield via
lists.yoctoproject.org
<bruce.ashfield=gmail.com@lists.yoctoproject.org> wrote:
>
> On Fri, Jul 17, 2020 at 1:56 PM Robert Berger
> <robert.berger.yocto.user@gmail.com> wrote:
> >
> > index.json looks like this:
> >
> > {
> >   "schemaVersion": 2,
> >   "manifests": [
> >     {
> >       "mediaType": "application/vnd.oci.image.manifest.v1+json",
> >       "size": 420,
> >       "digest": "sha256:63f34b526be88da860b1ae7969430bc7d20f233a58e13fc0f3770e61e037ebba",
> >       "platform": {
> >         "architecture": "arm",
> >         \"variant\": "v7",
> >         "os": "linux"
> >       },
> >       "annotations": {
> >         "org.opencontainers.image.ref.name": "latest"
> >       }
> >     }
> >   ]
> > }
> >
> > \"variant\": "v7" should be "variant": "v7"
> >
> > I just hacked it like this in one of my custom scripts:
> >
> > sed -i 's/\\"variant\\"/"variant"/g' ${OCI}/index.json
> >
> > But this is not an appropriate fix.
> >
> > The problem seems to be a combination of image-oci.bbclass and sloci-image.
>
> It's sloci-image. I'll pull together a fix.
>
> Bruce
>
> >
> > Regards,
> >
> > Robert
>
>
>
> --
> - Thou shalt not follow the NULL pointer, for chaos and madness await
> thee at its end
> - "Use the force Harry" - Gandalf, Star Trek II
> 



-- 
- Thou shalt not follow the NULL pointer, for chaos and madness await
thee at its end
- "Use the force Harry" - Gandalf, Star Trek II

--00000000000070671a05aaa7d677
Content-Type: application/octet-stream; 
	name="0001-sloci-image-fix-variant-quoting.patch"
Content-Disposition: attachment; 
	filename="0001-sloci-image-fix-variant-quoting.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_kcqldqyp0>
X-Attachment-Id: f_kcqldqyp0

RnJvbSAyZTRhNWU1NTExZmNlNTM3YWI2OTNlZTViOWFmYTQyNTUzZGVlMThjIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwu
Y29tPgpEYXRlOiBGcmksIDE3IEp1bCAyMDIwIDE1OjAyOjM3IC0wNDAwClN1YmplY3Q6IFtQQVRD
SF0gc2xvY2ktaW1hZ2U6IGZpeCB2YXJpYW50IHF1b3RpbmcKCkJhc2ggZG9lc24ndCBkZWFsIHZl
cnkgd2VsbCB3aXRoIHRoZSBxdW90ZWQgInZhcmlhbnQiIGluIHRoZQpvdXRwdXQgb2YgdGhlIG9j
aS1pbWFnZS1pbmRleC4gV2UgY2FuIGNhbGN1bGF0ZSB0aGUgc3RyaW5nIGF0CnRoZSB0b3Agb2Yg
dGhlIGZ1bmN0aW9uLCBhbmQganVzdCB1c2UgaXQgYXMgYSB3aG9sZSB0byBhdm9pZApuZWVkaW5n
IHRvIGZpZ3VyZSBvdXQgdGhlIHF1b3RlIGVzY2FwaW5nLgoKTm8gY2hhbmdlcyBpbiB0aGUgb3V0
cHV0LCBleGNlcHQgYSBwcm9wZXJseSBxdW90ZWQgInZhcmlhbnQiCndoZW4gYSB2YXJpYW50IGlz
IGRlZmluZWQuCgpXZSBhbHNvIGFkanVzdCB0aGUgZGVmaW5pdGlvbiBvZiAiUyIsIHNpbmNlIGl0
IHJlYWxseSB3YXNuJ3QKY29ycmVjdCBiZWZvcmUsIGFuZCBub3cgdGhhdCB3ZSBoYXZlIHBhdGNo
ZXMsIGl0IGlzIG1vcmUKaW1wb3J0YW50LgoKU2lnbmVkLW9mZi1ieTogQnJ1Y2UgQXNoZmllbGQg
PGJydWNlLmFzaGZpZWxkQGdtYWlsLmNvbT4KLS0tCiAuLi4vc2xvY2ktaW1hZ2Uvc2xvY2ktaW1h
Z2UtbmF0aXZlX2dpdC5iYiAgICAgfCAxMSArKystLQogLi4uMDAwMS1zbG9jaS1pbWFnZS1maXgt
dmFyaWFudC1xdW90aW5nLnBhdGNoIHwgNDIgKysrKysrKysrKysrKysrKysrKwogMiBmaWxlcyBj
aGFuZ2VkLCA0OSBpbnNlcnRpb25zKCspLCA0IGRlbGV0aW9ucygtKQogY3JlYXRlIG1vZGUgMTAw
NjQ0IHJlY2lwZXMtY29udGFpbmVycy9zbG9jaS1pbWFnZS9zbG9jaS1pbWFnZS8wMDAxLXNsb2Np
LWltYWdlLWZpeC12YXJpYW50LXF1b3RpbmcucGF0Y2gKCmRpZmYgLS1naXQgYS9yZWNpcGVzLWNv
bnRhaW5lcnMvc2xvY2ktaW1hZ2Uvc2xvY2ktaW1hZ2UtbmF0aXZlX2dpdC5iYiBiL3JlY2lwZXMt
Y29udGFpbmVycy9zbG9jaS1pbWFnZS9zbG9jaS1pbWFnZS1uYXRpdmVfZ2l0LmJiCmluZGV4IDU2
ZThlMGYuLmIzYjExYmQgMTAwNjQ0Ci0tLSBhL3JlY2lwZXMtY29udGFpbmVycy9zbG9jaS1pbWFn
ZS9zbG9jaS1pbWFnZS1uYXRpdmVfZ2l0LmJiCisrKyBiL3JlY2lwZXMtY29udGFpbmVycy9zbG9j
aS1pbWFnZS9zbG9jaS1pbWFnZS1uYXRpdmVfZ2l0LmJiCkBAIC0xLDcgKzEsMTAgQEAKIFNVTU1B
UlkgPSAiQSBzaW1wbGUgQ0xJIHRvb2wgZm9yIHBhY2tpbmcgcm9vdGZzIGludG8gYSBzaW5nbGUt
bGF5ZXIgT0NJIGltYWdlIgogTElDRU5TRSA9ICJNSVQiCi1MSUNfRklMRVNfQ0hLU1VNID0gImZp
bGU6Ly9naXQvTElDRU5TRTttZDU9OTQ4Y2Q4ZTU5MDY5ZmFkOTkyYjA0NjlhZjlhZDc5NjYiCi1T
UkNfVVJJID0gImdpdDovL2dpdGh1Yi5jb20vamlydXRrYS9zbG9jaS1pbWFnZS5naXQiCitMSUNf
RklMRVNfQ0hLU1VNID0gImZpbGU6Ly9MSUNFTlNFO21kNT05NDhjZDhlNTkwNjlmYWQ5OTJiMDQ2
OWFmOWFkNzk2NiIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS9qaXJ1dGthL3Nsb2NpLWlt
YWdlLmdpdCBcCisgICAgICAgICAgIGZpbGU6Ly8wMDAxLXNsb2NpLWltYWdlLWZpeC12YXJpYW50
LXF1b3RpbmcucGF0Y2ggXAorICAgICAgICAgICIKKwogCiBERVBFTkRTID0gIiIKIApAQCAtMTAs
MTMgKzEzLDEzIEBAIFBWID0gInYwLjEuMCtnaXQke1NSQ1BWfSIKIAogaW5oZXJpdCBuYXRpdmUK
IAotUyA9ICIke1dPUktESVJ9IgorUyA9ICIke1dPUktESVJ9L2dpdCIKIAogZG9fY29tcGlsZSgp
IHsgCiAJOgogfQogCiBkb19pbnN0YWxsKCkgewotCWNkICR7U30vZ2l0CisJY2QgJHtTfQogICAg
ICAgICBtYWtlIFBSRUZJWD0iJHtleGVjX3ByZWZpeH0iIERFU1RESVI9JHtEfSBpbnN0YWxsCiB9
CmRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvc2xvY2ktaW1hZ2Uvc2xvY2ktaW1hZ2Uv
MDAwMS1zbG9jaS1pbWFnZS1maXgtdmFyaWFudC1xdW90aW5nLnBhdGNoIGIvcmVjaXBlcy1jb250
YWluZXJzL3Nsb2NpLWltYWdlL3Nsb2NpLWltYWdlLzAwMDEtc2xvY2ktaW1hZ2UtZml4LXZhcmlh
bnQtcXVvdGluZy5wYXRjaApuZXcgZmlsZSBtb2RlIDEwMDY0NAppbmRleCAwMDAwMDAwLi41NzA0
M2NmCi0tLSAvZGV2L251bGwKKysrIGIvcmVjaXBlcy1jb250YWluZXJzL3Nsb2NpLWltYWdlL3Ns
b2NpLWltYWdlLzAwMDEtc2xvY2ktaW1hZ2UtZml4LXZhcmlhbnQtcXVvdGluZy5wYXRjaApAQCAt
MCwwICsxLDQyIEBACitGcm9tIGY3YjI3ODY0MjhjNTJhNTZiNTQ5YjE5ZmU3MjRjY2Q1NGY5NGYx
MTEgTW9uIFNlcCAxNyAwMDowMDowMCAyMDAxCitGcm9tOiBCcnVjZSBBc2hmaWVsZCA8YnJ1Y2Uu
YXNoZmllbGRAZ21haWwuY29tPgorRGF0ZTogRnJpLCAxNyBKdWwgMjAyMCAxNDo0MDoxMiAtMDQw
MAorU3ViamVjdDogW1BBVENIXSBzbG9jaS1pbWFnZTogZml4IHZhcmlhbnQgcXVvdGluZworCitC
YXNoIGRvZXNuJ3QgZGVhbCB2ZXJ5IHdlbGwgd2l0aCB0aGUgcXVvdGVkICJ2YXJpYW50IiBpbiB0
aGUKK291dHB1dCBvZiB0aGUgb2NpLWltYWdlLWluZGV4LiBXZSBjYW4gY2FsY3VsYXRlIHRoZSBz
dHJpbmcgYXQKK3RoZSB0b3Agb2YgdGhlIGZ1bmN0aW9uLCBhbmQganVzdCB1c2UgaXQgYXMgYSB3
aG9sZSB0byBhdm9pZAorbmVlZGluZyB0byBmaWd1cmUgb3V0IHRoZSBxdW90ZSBlc2NhcGluZy4K
KworTm8gY2hhbmdlcyBpbiB0aGUgb3V0cHV0LCBleGNlcHQgYSBwcm9wZXJseSBxdW90ZWQgInZh
cmlhbnQiCit3aGVuIGEgdmFyaWFudCBpcyBkZWZpbmVkLgorCitTaWduZWQtb2ZmLWJ5OiBCcnVj
ZSBBc2hmaWVsZCA8YnJ1Y2UuYXNoZmllbGRAZ21haWwuY29tPgorLS0tCisgc2xvY2ktaW1hZ2Ug
fCAzICsrLQorIDEgZmlsZSBjaGFuZ2VkLCAyIGluc2VydGlvbnMoKyksIDEgZGVsZXRpb24oLSkK
KworZGlmZiAtLWdpdCBhL3Nsb2NpLWltYWdlIGIvc2xvY2ktaW1hZ2UKK2luZGV4IGJlOGU3OWEu
LmZjY2UyMTkgMTAwNzU1CistLS0gYS9zbG9jaS1pbWFnZQorKysrIGIvc2xvY2ktaW1hZ2UKK0BA
IC0yOTgsNiArMjk4LDcgQEAgb2NpX2ltYWdlX2NvbmZpZygpIHsKKyAjICQxOiBkaWdlc3Qgb2Yg
dGhlIGltYWdlIG1hbmlmZXN0IGpzb24gKG11c3QgYmUgaW4gYmxvYnMgZGlyZWN0b3J5KQorIG9j
aV9pbWFnZV9pbmRleCgpIHsKKyAJbG9jYWwgbWFuaWZlc3RfZGlnZXN0PSIkMSIKKysJbG9jYWwg
dmFyaWFudF9zdHJpbmc9IlwidmFyaWFudFwiOiAkKGpzb25fc3RyaW5nICIkQ0ZHX0FSQ0hfVkFS
SUFOVCIpLCIKKyAKKyAJY2F0IDw8LUVPRgorIAl7CitAQCAtMzA5LDcgKzMxMCw3IEBAIG9jaV9p
bWFnZV9pbmRleCgpIHsKKyAJICAgICAgImRpZ2VzdCI6ICIkbWFuaWZlc3RfZGlnZXN0IiwKKyAJ
ICAgICAgInBsYXRmb3JtIjogeworIAkgICAgICAgICJhcmNoaXRlY3R1cmUiOiAiJChvY2lfYXJj
aCAkQ0ZHX0FSQ0gpIiwKKy0JICAgICAgICAke0NGR19BUkNIX1ZBUklBTlQ6KyJcInZhcmlhbnRc
IjogJChqc29uX3N0cmluZyAiJENGR19BUkNIX1ZBUklBTlQiKSwifQorKwkJJHtDRkdfQVJDSF9W
QVJJQU5UOiskdmFyaWFudF9zdHJpbmd9CisgCSAgICAgICAgIm9zIjogIiRDRkdfT1MiCisgCSAg
ICAgIH0sCisgCSAgICAgICJhbm5vdGF0aW9ucyI6IHsKKy0tIAorMi4xOS4xCisKLS0gCjIuMTku
MQoK

--00000000000070671a05aaa7d677--
