Return-Path: <joakim.roubert@axis.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 171CEC4167B
	for <webhook@archiver.kernel.org>; Fri,  2 Dec 2022 10:31:51 +0000 (UTC)
Received: from smtp1.axis.com (smtp1.axis.com [195.60.68.17])
 by mx.groups.io with SMTP id smtpd.web11.71942.1669977106855796868
 for <meta-virtualization@lists.yoctoproject.org>;
 Fri, 02 Dec 2022 02:31:47 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@axis.com header.s=axis-central1 header.b=h9Y74mRu;
 spf=pass (domain: axis.com, ip: 195.60.68.17, mailfrom: joakim.roubert@axis.com)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=axis.com; q=dns/txt; s=axis-central1; t=1669977107;
  x=1701513107;
  h=message-id:date:mime-version:subject:to:references:from:
   in-reply-to;
  bh=evBlWwy/QzPd9Gwei4Bay/knAcAUUY5W4Ff5JJFNd/E=;
  b=h9Y74mRundv/SFMXYj/Kmb9W0QBUCpcACA/3q91842typzG+acDzevL4
   LuzL0eypn/6TuVzOwjllgnh2ryvO1O476fpuTg9XcyM5skrif3u60NhE3
   Ni2uYwIyvsG2zfVPALNQmbZ6u2dmUuSXf5hzvtKtoMxKZBTFiHVX8qFwx
   1o6zSVvrIOFMVRpfHP5KLAMSehApK4SeTp5ctpes6yIbmYxUnyUX6aGly
   p2TNv9FFoUPX5wxpjboqbfLhfEIr+bNjfLgcV8Af8yRudOd34qKd94YJq
   jV/7sps03UrnIfpMyALxtqAM0jtCSW5qpqTqzyFyEUKEltEaPzE8Wq3Mf
   A==;
Content-Type: multipart/mixed;
	boundary="------------4Yjtzvi9gj2E2x26WgqkVSBW"
Message-ID: <2d1a935a-9a05-3c5c-e700-031b84ff83a2@axis.com>
Date: Fri, 2 Dec 2022 11:31:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.0
Subject: Re: [meta-virtualization] [Question] upx: do_fetch: Bitbake Fetcher
 Error:,FetchError('Submodule refers to the parent repository.
Content-Language: en-US
To: <meta-virtualization@lists.yoctoproject.org>
References: <ddf7cf66-0067-2ea9-dbad-a73bba79a5db@axis.com>
 <172CB2E0F08C4564.1705@lists.yoctoproject.org>
 <CADkTA4M=vRTm4Ty1Y1y_5Ehjb94Omk-MNeEFPtGZUsoS6xGsOw@mail.gmail.com>
 <172CED9C275BE617.27320@lists.yoctoproject.org>
From: Joakim Roubert <joakim.roubert@axis.com>
In-Reply-To: <172CED9C275BE617.27320@lists.yoctoproject.org>
X-Originating-IP: [10.0.5.60]
X-ClientProxiedBy: se-mail03w.axis.com (10.20.40.9) To se-mail07w.axis.com
 (10.20.40.13)
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Fri, 02 Dec 2022 10:31:51 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/7730

--------------4Yjtzvi9gj2E2x26WgqkVSBW
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

On 2022-12-02 09:46, Joakim Roubert wrote:
> 
> Thanks a lot; I tried it out immediately.
> It will, however, give me the same gitsm error:
[...]

By using the git fetcher instead of the gitsm one and explicitly add the 
submodules (whth the corresponding commits) in the recipe as per the 
attached patch (on latest master-next that has your latest fixes), upx 
will build properly here again.

BR,

/Joakim

--------------4Yjtzvi9gj2E2x26WgqkVSBW
Content-Type: text/x-patch; charset="UTF-8";
	name="0001-upx-Use-git-fetcher-instead-of-gitsm.patch"
Content-Disposition: attachment;
	filename="0001-upx-Use-git-fetcher-instead-of-gitsm.patch"
Content-Transfer-Encoding: base64

RnJvbSBhNDllMWNkNTllMDVlMjNkYjY1ZjI4NDZmZWVhZmNjNjljYmE0NTQzIE1vbiBTZXAg
MTcgMDA6MDA6MDAgMjAwMQpGcm9tOiBKb2FraW0gUm91YmVydCA8am9ha2ltckBheGlzLmNv
bT4KRGF0ZTogRnJpLCAyIERlYyAyMDIyIDExOjI1OjE1ICswMTAwClN1YmplY3Q6IFtQQVRD
SF0gdXB4OiBVc2UgZ2l0IGZldGNoZXIgaW5zdGVhZCBvZiBnaXRzbQoKVGhlIGN1cnJlbnQg
dXB4IHdpbGwgdHJpZ2dlciB0aGUgQml0YmFrZSBGZXRjaGVyIEVycm9yIGFkZGVkIGluCktp
cmtzdG9uZSA0LjAuNSAxODlhNmQ0NTJlMzAzN2M5ZTk0Y2NkZjZhZjM4MzU5ZmM2MDU4MDY0
IGNvbW1pdC4gVGhpcwpwYXRjaCByZXBsYWNlcyBnaXRzbSB3aXRoIGdpdCBhbmQgZXhwbGlj
aXRseSBhZGRzIHRoZSBnaXQgc3VibW9kdWxlcwp3aXRoIHRoZSBjb3JyZXNwb25kaW5nIGNv
bW1pdHMuCgpDaGFuZ2UtSWQ6IEkxYjEyMzFmMDY0ODFmN2ExZTI1ZGMzNTI3N2QwZjE3MjVj
NzYzMWUwClNpZ25lZC1vZmYtYnk6IEpvYWtpbSBSb3ViZXJ0IDxqb2FraW1yQGF4aXMuY29t
PgotLS0KIHJlY2lwZXMtZXh0ZW5kZWQvdXB4L3VweF9naXQuYmIgfCAxMyArKysrKysrKysr
Ky0tCiAxIGZpbGUgY2hhbmdlZCwgMTEgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlvbnMoLSkK
CmRpZmYgLS1naXQgYS9yZWNpcGVzLWV4dGVuZGVkL3VweC91cHhfZ2l0LmJiIGIvcmVjaXBl
cy1leHRlbmRlZC91cHgvdXB4X2dpdC5iYgppbmRleCA5ODliMjc3Li5iYjgwMDRjIDEwMDY0
NAotLS0gYS9yZWNpcGVzLWV4dGVuZGVkL3VweC91cHhfZ2l0LmJiCisrKyBiL3JlY2lwZXMt
ZXh0ZW5kZWQvdXB4L3VweF9naXQuYmIKQEAgLTEsOCArMSwxNyBAQAogSE9NRVBBR0UgPSAi
aHR0cDovL3VweC5zb3VyY2Vmb3JnZS5uZXQiCiBTVU1NQVJZID0gIlVsdGltYXRlIGV4ZWN1
dGFibGUgY29tcHJlc3Nvci4iCiAKLVNSQ1JFViA9ICI4ZDFhOThlMDNiZjI4MWIyY2VlNDU5
YjZjMjczNDdlNTZkMTNjNmE4IgotU1JDX1VSSSA9ICJnaXRzbTovL2dpdGh1Yi5jb20vdXB4
L3VweDticmFuY2g9ZGV2ZWw7cHJvdG9jb2w9aHR0cHMgXAorU1JDUkVWX3VweCA9ICI4ZDFh
OThlMDNiZjI4MWIyY2VlNDU5YjZjMjczNDdlNTZkMTNjNmE4IgorU1JDUkVWX3ZlbmRvcl9k
b2N0ZXN0ID0gIjY2NmU2NDhiNjhmZGEyZGViMTQxYTFmZTkzZTNmZDFlMjc5NWRkMGYiCitT
UkNSRVZfdmVuZG9yX2x6bWFfc2RrID0gIjllYmY4ZjQ2OGM2ODlkODM1MDRlNmMwOGM2YmMy
NmM0YTFjZjE4MGYiCitTUkNSRVZfdmVuZG9yX3VjbCA9ICI0YjU4ZDU5MjE5OWRjMWU1ZGI2
OTFlMWE1NGZiMGU1ZTlhZjBlY2FmIgorU1JDUkVWX3ZlbmRvcl96bGliID0gIjJhNWIzMzhl
YjE3M2E3MDFlZDE3OWU5NTFkNGMzOTBlNzVlOGQ0YzciCitTUkNSRVZfRk9STUFUID0gInVw
eCIKK1NSQ19VUkkgPSAiZ2l0Oi8vZ2l0aHViLmNvbS91cHgvdXB4O25hbWU9dXB4O2JyYW5j
aD1kZXZlbDtwcm90b2NvbD1odHRwcyBcCisgICAgICAgICAgIGdpdDovL2dpdGh1Yi5jb20v
dXB4L3VweC12ZW5kb3ItZG9jdGVzdDtuYW1lPXZlbmRvcl9kb2N0ZXN0O3N1YmRpcj1naXQv
dmVuZG9yL2RvY3Rlc3Q7YnJhbmNoPXVweC12ZW5kb3I7cHJvdG9jb2w9aHR0cHMgXAorICAg
ICAgICAgICBnaXQ6Ly9naXRodWIuY29tL3VweC91cHgtdmVuZG9yLWx6bWEtc2RrO25hbWU9
dmVuZG9yX2x6bWFfc2RrO3N1YmRpcj1naXQvdmVuZG9yL2x6bWEtc2RrO2JyYW5jaD11cHgt
dmVuZG9yO3Byb3RvY29sPWh0dHBzIFwKKyAgICAgICAgICAgZ2l0Oi8vZ2l0aHViLmNvbS91
cHgvdXB4LXZlbmRvci11Y2w7bmFtZT12ZW5kb3JfdWNsO3N1YmRpcj1naXQvdmVuZG9yL3Vj
bDticmFuY2g9dXB4LXZlbmRvcjtwcm90b2NvbD1odHRwcyBcCisgICAgICAgICAgIGdpdDov
L2dpdGh1Yi5jb20vdXB4L3VweC12ZW5kb3ItemxpYjtuYW1lPXZlbmRvcl96bGliO3N1YmRp
cj1naXQvdmVuZG9yL3psaWI7YnJhbmNoPXVweC12ZW5kb3I7cHJvdG9jb2w9aHR0cHMgXAog
IgogCiBMSUNFTlNFID0gIkdQTC0yLjAtb25seSIKLS0gCjIuMzAuMgoK

--------------4Yjtzvi9gj2E2x26WgqkVSBW--

