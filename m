Return-Path: <jonatan.palsson@pelagicore.com>
Received: from mail-vb0-f54.google.com (mail-vb0-f54.google.com
	[209.85.212.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 059CCE01713
	for <meta-virtualization@yoctoproject.org>;
	Sun, 20 Oct 2013 23:37:58 -0700 (PDT)
Received: by mail-vb0-f54.google.com with SMTP id q14so3739600vbe.13
	for <meta-virtualization@yoctoproject.org>;
	Sun, 20 Oct 2013 23:37:57 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:date:message-id:subject:from:to
	:content-type;
	bh=A8WSVhyon5EpAervzSZv2Y6Xbcfstp26f4JIflacfXU=;
	b=TzddHSHvng4D6ZwZIs8VnkzfIlPjIu3mfS56icmFX1c2MKhXr4MjVQnTZgj/LWKjrV
	IMpCFLNWsRQaBKg7eFypT/EwnrEBmrmWqwMJc08BFpsHx475mcqcU93IVMe/RqfO1HVK
	m2Ksa9v9pMnMN6ncKQKJnUPZI0Vb3ORXhNf7mBIpWn8aGNKpZ3FP0C8RrwwucfEI8yfS
	ZxM8uiMgKj4R5qtZUEAJ3+V5ZMsH76GYXaKnawz+DF2Rq1IeaURhj6lQl9M+KnbOh4+B
	gyEqNge/AHl1jNNiVVDaR/RAWCtdjo7HkCTMGy7uNDDrDDasTYy/HYANglRizfzUKKfY
	eXuw==
X-Gm-Message-State: ALoCoQkcG8bfo6s+2/tqGEr0JHhD0rhi1XGvw/pqt4RkgZZg1N8+TfxMv8NT1Tb24KiKOXZagdRM
MIME-Version: 1.0
X-Received: by 10.58.216.74 with SMTP id oo10mr1523845vec.0.1382337477568;
	Sun, 20 Oct 2013 23:37:57 -0700 (PDT)
Received: by 10.220.101.12 with HTTP; Sun, 20 Oct 2013 23:37:57 -0700 (PDT)
Date: Mon, 21 Oct 2013 08:37:57 +0200
Message-ID: <CABYQY==EU9m2OV1LEi2NP6xqed2q0dVb9YnGkZyj20UE9E-5Jw@mail.gmail.com>
From: =?ISO-8859-1?Q?Jonatan_P=E5lsson?= <jonatan.palsson@pelagicore.com>
To: meta-virtualization@yoctoproject.org
Subject: PATCH: Fix URL for LXC tarball
X-BeenThere: meta-virtualization@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: "Discussion of layer enabling hypervisor, virtualization tool stack,
	and cloud support" <meta-virtualization.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-virtualization>
List-Post: <mailto:meta-virtualization@yoctoproject.org>
List-Help: <mailto:meta-virtualization-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-virtualization>, 
	<mailto:meta-virtualization-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 21 Oct 2013 06:38:00 -0000
X-Groupsio-MsgNum: 470
Content-Type: multipart/mixed; boundary=047d7b86e3d84f9c4604e93a863b

--047d7b86e3d84f9c4604e93a863b
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

Hello,

See the following patch for the correct URL.

--=20
Regards,
Jonatan P=E5lsson

Pelagicore AB
Ekelundsgatan 4, 6th floor, SE-411 18 Gothenburg, Sweden

--047d7b86e3d84f9c4604e93a863b
Content-Type: application/octet-stream; 
	name="0001-lxc-fixed-URL-for-tarball.patch"
Content-Disposition: attachment; 
	filename="0001-lxc-fixed-URL-for-tarball.patch"
Content-Transfer-Encoding: base64
X-Attachment-Id: f_hn1byomt0

RnJvbSA3YzY0ZTc2YmQxYzI1NzhiOWNjNWY3OTJmYTYyMzA4ZjJhYTQxY2JkIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiA9P1VURi04P3E/Sm9uYXRhbj0yMFA9QzM9QTVsc3Nvbj89IDxq
b25hdGFuLnBhbHNzb25AcGVsYWdpY29yZS5jb20+CkRhdGU6IE1vbiwgMjEgT2N0IDIwMTMgMDg6
MjI6MjIgKzAyMDAKU3ViamVjdDogW1BBVENIXSBseGM6IGZpeGVkIFVSTCBmb3IgdGFyYmFsbApN
SU1FLVZlcnNpb246IDEuMApDb250ZW50LVR5cGU6IHRleHQvcGxhaW47IGNoYXJzZXQ9VVRGLTgK
Q29udGVudC1UcmFuc2Zlci1FbmNvZGluZzogOGJpdAoKU2lnbmVkLW9mZi1ieTogSm9uYXRhbiBQ
w6Vsc3NvbiA8am9uYXRhbi5wYWxzc29uQHBlbGFnaWNvcmUuY29tPgotLS0KIHJlY2lwZXMtY29u
dGFpbmVycy9seGMvbHhjXzAuOS4wLmJiIHwgMiArLQogMSBmaWxlIGNoYW5nZWQsIDEgaW5zZXJ0
aW9uKCspLCAxIGRlbGV0aW9uKC0pCgpkaWZmIC0tZ2l0IGEvcmVjaXBlcy1jb250YWluZXJzL2x4
Yy9seGNfMC45LjAuYmIgYi9yZWNpcGVzLWNvbnRhaW5lcnMvbHhjL2x4Y18wLjkuMC5iYgppbmRl
eCA1NjMxMzFmLi4wYTdlNjc0IDEwMDY0NAotLS0gYS9yZWNpcGVzLWNvbnRhaW5lcnMvbHhjL2x4
Y18wLjkuMC5iYgorKysgYi9yZWNpcGVzLWNvbnRhaW5lcnMvbHhjL2x4Y18wLjkuMC5iYgpAQCAt
MjEsNyArMjEsNyBAQCBSREVQRU5EU18ke1BOfSA9ICIgXAogCQlwZXJsLW1vZHVsZS1leHBvcnRl
ci1oZWF2eSBcCiAiCiAKLVNSQ19VUkkgPSAiaHR0cDovL2x4Yy5zb3VyY2Vmb3JnZS5uZXQvZG93
bmxvYWQvbHhjLyR7UE59LSR7UFZ9LnRhci5neiBcCitTUkNfVVJJID0gImh0dHA6Ly9seGMuc291
cmNlZm9yZ2UubmV0L2Rvd25sb2Fkcy8ke1BOfS0ke1BWfS50YXIuZ3ogXAogCWZpbGU6Ly9seGMt
MC45LjAtZGlzYWJsZS11ZGhjcC1mcm9tLWJ1c3lib3gtdGVtcGxhdGUucGF0Y2ggXAogCWZpbGU6
Ly9seGMtMC45LjAtZW5hYmxlLWNocm9vdC1jaHBhc3N3ZC1mdW5jdGlvbmFsaXR5LWZvci1idXN5
Ym94LWhvc3RzLnBhdGNoIFwKICAgICBmaWxlOi8vbHhjLTAuOS4wLWNoZWNrLXdoZW4tYmluZC1t
b3VudGluZy1saWJkaXJzLnBhdGNoIFwKLS0gCjEuOC40LnJjMwoK

--047d7b86e3d84f9c4604e93a863b--
