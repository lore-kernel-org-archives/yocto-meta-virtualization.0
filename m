Return-Path: <bostancioglucevat@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 7613FE00A96; Fri, 14 Jun 2019 09:16:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM, FROM_EXCESS_BASE64,
	HTML_MESSAGE, RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (bostancioglucevat[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.208.42 listed in list.dnswl.org]
	*  0.0 HTML_MESSAGE BODY: HTML included in message
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	*  1.0 FROM_EXCESS_BASE64 From: base64 encoded unnecessarily
Received: from mail-ed1-f42.google.com (mail-ed1-f42.google.com
	[209.85.208.42])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id F2364E0049C
	for <meta-virtualization@yoctoproject.org>;
	Fri, 14 Jun 2019 09:16:40 -0700 (PDT)
Received: by mail-ed1-f42.google.com with SMTP id k21so4281462edq.3
	for <meta-virtualization@yoctoproject.org>;
	Fri, 14 Jun 2019 09:16:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=ze9SupsWqJ2xoMKlDWFUxjsKYWcsvyHtXLWLsLkl8ls=;
	b=sAoS4F4rWtR9YTYQG0BfmgHn8UoJsPFnZ7XZteyGW97tx/K07T0G0niR6GnS4UObY+
	8gFcPj7hfNJRHbttIJRW+2+4G27hE3XnSerAd6+rPgMiAP6TJC4o0mYa/Uu48YcH98I2
	5AHxPIgUZYJPEpvnZgB/Nchhe8WHrCjsl+JVaxL3yQRDTeu1VHaWj/TEj7YaeE28cgW7
	SP/BfkUTNxjPLFz0XChXodA8ZkaUfK4bkGagH6GktnGakzeHoVC/mVIccp6jhhh7pnEk
	5SJtZ71H3/SmEV1Zc6fw9mtlEa4c2s3fvk9hUHErjwxpBDm9Zqexyo8zofLbqs97xlZi
	j9zw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=ze9SupsWqJ2xoMKlDWFUxjsKYWcsvyHtXLWLsLkl8ls=;
	b=jSxP5l+LpyqY+KxnTG20QLHVKAJkntngLVI8BLg82H3+1oFSe3+WoofWxq0xNLU4tH
	NUN4qQeE/ckM+CxYSIqTc4ippDheqWTQgsqiZMahOHkeBvChnfj0wyRziZwh3n4LCOHN
	eD2Hh0tzgyPvI3gcGDVmA7v1kZeTWnWAlvdn+5KwR3oldWIMJZwXbRLqQDzCIMVKu0P9
	H8af8FWDiJbJUjKCcDeTAj1UeFe02feUm92iQPMZkL3G+AMBLRKn04JH6g+mtGxM5Cvr
	JZIJ2mrDhQemv0cAyilgZf42U6vdgVKgdnGDS7+XUS1PGNdFogBy74XIpceHipRLfjvS
	OpgQ==
X-Gm-Message-State: APjAAAXGxuVfCv2b1I5SNIyKbC6wYkhLHvOy8aVE2f7hb72Qp97MMH33
	/hz0nSZeB+lzOw4vksYsd6/zfUnSEdoAPA7qp9gZbmso
X-Google-Smtp-Source: APXvYqzPoYLHabtNoX49xt4y6bJGwVdabJqC6kRq2IitpfQU3ngmj+6puIoIlESD4aeh+JR04c++Uk3friqUw0yzhM0=
X-Received: by 2002:a17:906:7ac5:: with SMTP id
	k5mr7635233ejo.128.1560528999873; 
	Fri, 14 Jun 2019 09:16:39 -0700 (PDT)
MIME-Version: 1.0
From: =?UTF-8?B?Q2V2YXQgQm9zdGFuY8Sxb8SfbHU=?= <bostancioglucevat@gmail.com>
Date: Fri, 14 Jun 2019 19:16:29 +0300
Message-ID: <CABPcKDO-qfBmWUUWKVY-6V2Jn6RVJ+wRyT4L39LnG8Z_AnfhBw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: kvmtool: Compile time error fixed.
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
X-List-Received-Date: Fri, 14 Jun 2019 16:16:41 -0000
X-Groupsio-MsgNum: 4239
Content-Type: multipart/mixed; boundary="000000000000b31f69058b4af8e2"

--000000000000b31f69058b4af8e2
Content-Type: multipart/alternative; boundary="000000000000b31f65058b4af8e0"

--000000000000b31f65058b4af8e0
Content-Type: text/plain; charset="UTF-8"



--000000000000b31f65058b4af8e0
Content-Type: text/html; charset="UTF-8"

<div dir="ltr"><br></div>

--000000000000b31f65058b4af8e0--

--000000000000b31f69058b4af8e2
Content-Type: text/x-patch; charset="US-ASCII"; 
	name="0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch"
Content-Disposition: attachment; 
	filename="0002-kvmtool-add-EXTRA_CFLAGS-variable-and-disable-werror.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jwwao05u0>
X-Attachment-Id: f_jwwao05u0

RnJvbSA4ZTI5MWFmMTkxMzM5NDcxYzIwMjkyNzg0ZWJiNmRlNjEyMmY0ZmM0IE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBDZXZhdCBCb3N0YW5jaW9nbHUgPGJvc3RhbmNpb2dsdWNldmF0
QGdtYWlsLmNvbT4KRGF0ZTogRnJpLCAxNCBKdW4gMjAxOSAxODo0NzoyNSArMDMwMApTdWJqZWN0
OiBbUEFUQ0hdIGt2bXRvb2w6IGFkZCBDRkxBR1MgVmFyaWFibGUgYW5kIGRpc2FibGUgV2Vycm9y
Cgp0byBhdm9pZCBDRkxBR1MgYW5kIHdhcm5pbmdzIHZpYSBjb21tYW5kIGFyZ3VtZW50Ci0tLQog
TWFrZWZpbGUgfCAzICsrKwogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKQoKZGlmZiAt
LWdpdCBhL01ha2VmaWxlIGIvTWFrZWZpbGUKaW5kZXggMDMwZmY0ZS4uZTBhOGIyMyAxMDA2NDQK
LS0tIGEvTWFrZWZpbGUKKysrIGIvTWFrZWZpbGUKQEAgLTIsNiArMiw5IEBACiAjIERlZmluZSBX
RVJST1I9MCB0byBkaXNhYmxlIC1XZXJyb3IuCiAjCiAKK1dFUlJPUj0wCitDRkxBR1MgKz0gJChF
WFRSQV9DRkxBR1MpCisKIGlmZXEgKCQoc3RyaXAgJChWKSksKQogCUUgPSBAZWNobwogCVEgPSBA
Ci0tIAoyLjcuNAo=

--000000000000b31f69058b4af8e2--
