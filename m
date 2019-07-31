Return-Path: <anoop.karollil@gmail.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id AA51BE00D4E; Tue, 30 Jul 2019 17:32:28 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, FREEMAIL_FROM,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* 0.0 FREEMAIL_FROM Sender email is commonly abused enduser mail
	provider *      (anoop.karollil[at]gmail.com)
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at https://www.dnswl.org/,
	no *      trust
	*      [209.85.210.173 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from mail-pf1-f173.google.com (mail-pf1-f173.google.com
	[209.85.210.173])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 24A4BE00CD5
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2019 17:32:28 -0700 (PDT)
Received: by mail-pf1-f173.google.com with SMTP id g2so30753271pfq.0
	for <meta-virtualization@yoctoproject.org>;
	Tue, 30 Jul 2019 17:32:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=mime-version:from:date:message-id:subject:to;
	bh=xaS790s38yPBpKeQUr1wODukgeQCjZyHEaEi8epGCvc=;
	b=b+Wkyknuw8dShqkCbHQC+29CrPPDTfJbWS4llhjlEMqyTM4qz9DA8g79T8fBSGLBoV
	AIQFFfv1w9AtW/KmYDFjN+YzuMao4xDdpDyiyWdrxQSa0QcmhX0GReWKOXdky83F9n+O
	wXFBikvncQDfHhx5ONxNoconXIVrmnFFO/wAImUrWEVIgFuo3mX6y2CmL1vHfUlUYMPD
	DFI7sJ3pkdIGOFYtHFHshYTuiQC2eRcpuGfX+03tnOw8tj88aYPA1VG2oONKp5FBuxFd
	S6OqrtJT4W8onLZZPxFXhHc+q26S3V1iJ03KTr+s5fWsIh8csj30oqX1k/iv5rMIuYzu
	m4fg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=xaS790s38yPBpKeQUr1wODukgeQCjZyHEaEi8epGCvc=;
	b=LiPiPV9xuc7g6hjG180uTT/1tzw3nZ6kJi831RFiDmA21033ovwKxANiymTNMQyY0c
	P1gSWHKrQNbE/QLvR+rsAOrv01QcT656dCjf0V1h1QjxTgFyAO4qFaQWD2/IM2WbREpk
	BTT3/hZGOXZxaaGp1lu5SohfZ+ouA3sV2L6sDoEE+xSchbkMoqKO9cWIUiXMFbfyEQHX
	C6C9efhCyuZkjQcRyVEJy67EkGF+ybah8ofeKjIxo34DvNR40KgETYshnSjsYmczTEOC
	hAm/7eNVT7K1FUScj31CKmOxMEnC8JU0KpOj2Jp10SGdua8dZAzuRfUWArg5WgPmPyg8
	E97Q==
X-Gm-Message-State: APjAAAWkMwt5FF0ZAFUuCCNv4aBJO2aKZ5XQjUtHdmlVSij07K5xRi/C
	sEXMUwzLx/137GyswqNLpDQHcLGnnIAoXovls8J9Vcl9wooi
X-Google-Smtp-Source: APXvYqwJfVmP9jxH5dK0p1s3pSe6H0dWXZz3IO+vceajZ/DFrCdq4GQPbcVFROX2hspbGsY1G/Eo0BXphiWi0lP+rAw=
X-Received: by 2002:a17:90a:cb18:: with SMTP id
	z24mr101939pjt.108.1564533147292; 
	Tue, 30 Jul 2019 17:32:27 -0700 (PDT)
MIME-Version: 1.0
From: Anoop Karollil <anoop.karollil@gmail.com>
Date: Tue, 30 Jul 2019 17:32:15 -0700
Message-ID: <CAGayzYvR7CFPAdR604XndLVstcKTHDMHrDLoKzhC7QtLY5ZwDw@mail.gmail.com>
To: meta-virtualization@yoctoproject.org
Subject: Exclusion of devicemapper and btrfs graph drivers in docker_git.bb
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
X-List-Received-Date: Wed, 31 Jul 2019 00:32:28 -0000
X-Groupsio-MsgNum: 4319
Content-Type: multipart/mixed; boundary="0000000000007bf37a058eef4221"

--0000000000007bf37a058eef4221
Content-Type: text/plain; charset="UTF-8"

Hello,

I am trying to build docker with btrfs support. I could override
BUILDTAGS for containerd-opencontainers_git.bb using EXTRA_OEMAKE in a
bbappend to remove the `no_btrfs` build tag (see
http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/containerd/containerd.inc#n64).
But I do not know how to easily do the same for the
`exclude_graphdriver_btrfs` in docker_git.bb
(http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/tree/recipes-containers/docker/docker_git.bb#n95),
because dockerd gets compiled using `hack/make.sh` rather than via
oe_runmake. I can override the whole of do_compile in a .bbappend just
to strip the build tags, but that isn't very clean.

The docker package compiles fine when the exclusions for btrfs and
devicemapper are removed, so I am assuming whatever problem the
exclusion was trying to fix is gone. Could the exclusion build tags be
removed from the do_compile? If not, could the recipe declare a
BUILDTAGS = xxxx and use it for DOCKER_BUILDTAGS in the do_compile so
that a bbappend can override BUILDTAGS? I have attached a patch for
this approach. Not sure if there is an easy way to do this for the
recipe in its current state.

Thanks,
Anoop

--0000000000007bf37a058eef4221
Content-Type: application/octet-stream; 
	name="docker-build-tags-override.patch"
Content-Disposition: attachment; filename="docker-build-tags-override.patch"
Content-Transfer-Encoding: base64
Content-ID: <f_jyqik6lm0>
X-Attachment-Id: f_jyqik6lm0

RnJvbSAxOGVkNjY5ZmEwYjE1OWFiZjY3NTM3MTlkMDQ3NjY3MDhjMWU4NzJhIE1vbiBTZXAgMTcg
MDA6MDA6MDAgMjAwMQpGcm9tOiBBbm9vcCBLYXJvbGxpbCA8YW5vb3Aua2Fyb2xsaWxAZ21haWwu
Y29tPgpEYXRlOiBUaHUsIDI1IEp1bCAyMDE5IDExOjA0OjUwIC0wNzAwClN1YmplY3Q6IFttZXRh
LXZpcnR1YWxpemF0aW9uXVtQQVRDSF0gZG9ja2VyOiBEZWZpbmUgb3ZlcnJpZGUtYWJsZSBCVUlM
RF9UQUdTCiBpbiByZWNpcGUKCkRPQ0tFUl9CVUlMRFRBR1MgaGFzIHRhZ3MgdGhhdCBleGNsdWRl
IGJ0cmZzIGFuZCBkZXZpY2VtYXBwZXIgZ3JhcGgKZHJpdmVycy4gVG8gZW5hYmxlIGVpdGhlciwg
dGhlIHRhZ3MgaGF2ZSB0byBiZSByZW1vdmVkLCBidXQgdGhpcyBpc24ndAplYXNpbHkgcG9zc2li
bGUgYXMgRE9DS0VSX0JVSUxEVEFHUyBjYW4ndCBiZSBvdmVycmlkZGVuIHZpYSBhIGJiYXBwZW5k
CihhIG1ha2Uuc2ggc2NyaXB0IGlzIHVzZWQgdG8gYnVpbGQgZG9ja2VyZCByYXRoZXIgdGhhbiBv
ZV9ydW5tYWtlLCBzbwpvdmVycmlkaW5nIHdpdGggRVhUUkFfT0VNQUtFIGlzbid0IHBvc3NpYmxl
KS4KCkRlZmluZSBhIEJVSUxEX1RBR1MgdmFyaWFibGUgaW4gdGhlIGRvY2tlciByZWNpcGUgdGhh
dCBpcyBzZXQgd2l0aCB0aGUKY3VycmVudCBleGNsdWRlIHRhZ3MsIGFuZCB1c2UgaXQgZm9yIHNl
dHRpbmcgRE9DS0VSX0JVSUxEVEFHUy4gVGhpcwptYWtlcyBpdCBwb3NzaWJsZSBmb3IgZG93bnN0
cmVhbS91cHBlciBsYXllcnMgdG8gdHdlYWsKQlVJTERfVEFHUy9ET0NLRVJfQlVJTERfVEFHUyB2
aWEgYSBiYmFwcGVuZC4KClNpZ25lZC1vZmYtYnk6IEFub29wIEthcm9sbGlsIDxhbm9vcC5rYXJv
bGxpbEBnbWFpbC5jb20+Ci0tLQogcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXJfZ2l0
LmJiIHwgNSArKystLQogMSBmaWxlIGNoYW5nZWQsIDMgaW5zZXJ0aW9ucygrKSwgMiBkZWxldGlv
bnMoLSkKCmRpZmYgLS1naXQgYS9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlcl9naXQu
YmIgYi9yZWNpcGVzLWNvbnRhaW5lcnMvZG9ja2VyL2RvY2tlcl9naXQuYmIKaW5kZXggZmVjYTUz
Ni4uZTQ1Zjg3ZSAxMDA2NDQKLS0tIGEvcmVjaXBlcy1jb250YWluZXJzL2RvY2tlci9kb2NrZXJf
Z2l0LmJiCisrKyBiL3JlY2lwZXMtY29udGFpbmVycy9kb2NrZXIvZG9ja2VyX2dpdC5iYgpAQCAt
NjMsNiArNjMsOCBAQCBQViA9ICIke0RPQ0tFUl9WRVJTSU9OfStnaXQke1NSQ1JFVl9tb2J5fSIK
IFBBQ0tBR0VTID0rICIke1BOfS1jb250cmliIgogCiBET0NLRVJfUEtHPSJnaXRodWIuY29tL2Rv
Y2tlci9kb2NrZXIiCisjIGluIG9yZGVyIHRvIGV4Y2x1ZGUgZGV2aWNlbWFwcGVyIGFuZCBidHJm
cyAtIGh0dHBzOi8vZ2l0aHViLmNvbS9kb2NrZXIvZG9ja2VyL2lzc3Vlcy8xNDA1NgorQlVJTERf
VEFHUyA9ICJleGNsdWRlX2dyYXBoZHJpdmVyX2J0cmZzIGV4Y2x1ZGVfZ3JhcGhkcml2ZXJfZGV2
aWNlbWFwcGVyIgogCiBpbmhlcml0IGdvCiBpbmhlcml0IGdvYXJjaApAQCAtOTEsOCArOTMsNyBA
QCBkb19jb21waWxlKCkgewogCWV4cG9ydCBDR09fRU5BQkxFRD0iMSIKIAlleHBvcnQgQ0dPX0NG
TEFHUz0iJHtDRkxBR1N9IC0tc3lzcm9vdD0ke1NUQUdJTkdfRElSX1RBUkdFVH0iCiAJZXhwb3J0
IENHT19MREZMQUdTPSIke0xERkxBR1N9IC0tc3lzcm9vdD0ke1NUQUdJTkdfRElSX1RBUkdFVH0i
Ci0JIyBpbiBvcmRlciB0byBleGNsdWRlIGRldmljZW1hcHBlciBhbmQgYnRyZnMgLSBodHRwczov
L2dpdGh1Yi5jb20vZG9ja2VyL2RvY2tlci9pc3N1ZXMvMTQwNTYKLQlleHBvcnQgRE9DS0VSX0JV
SUxEVEFHUz0nZXhjbHVkZV9ncmFwaGRyaXZlcl9idHJmcyBleGNsdWRlX2dyYXBoZHJpdmVyX2Rl
dmljZW1hcHBlciAke1BBQ0tBR0VDT05GSUdfQ09ORkFSR1N9JworCWV4cG9ydCBET0NLRVJfQlVJ
TERUQUdTPScke0JVSUxEX1RBR1N9ICR7UEFDS0FHRUNPTkZJR19DT05GQVJHU30nCiAKIAlleHBv
cnQgRElTQUJMRV9XQVJOX09VVFNJREVfQ09OVEFJTkVSPTEKIAotLSAKMi4xNy4xCgo=

--0000000000007bf37a058eef4221--
