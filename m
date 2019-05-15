Return-Path: <mark.hatle@windriver.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1A3EFE00E10; Wed, 15 May 2019 11:27:54 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.2 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_MED
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [147.11.1.11 listed in list.dnswl.org]
Received: from mail.windriver.com (mail.windriver.com [147.11.1.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 86654E009A0
	for <meta-virtualization@yoctoproject.org>;
	Wed, 15 May 2019 11:27:40 -0700 (PDT)
Received: from ALA-HCA.corp.ad.wrs.com ([147.11.189.40])
	by mail.windriver.com (8.15.2/8.15.1) with ESMTPS id x4FIRd94004119
	(version=TLSv1 cipher=AES128-SHA bits=128 verify=FAIL);
	Wed, 15 May 2019 11:27:39 -0700 (PDT)
Received: from soho-mhatle-m.local (147.11.117.162) by ALA-HCA.corp.ad.wrs.com
	(147.11.189.50) with Microsoft SMTP Server id 14.3.439.0;
	Wed, 15 May 2019 11:27:38 -0700
To: "meta-virtualization@yoctoproject.org"
	<meta-virtualization@yoctoproject.org>
From: Mark Hatle <mark.hatle@windriver.com>
Openpgp: preference=signencrypt
Autocrypt: addr=mark.hatle@windriver.com; prefer-encrypt=mutual; keydata=
	mQENBFYKxFgBCACt/pzutBp6p/xVKTFJjHbM3KpQKCblyot/YP+bpTr51Hrc5xDXBQhoG7TC
	aIRvRIvbhEevEQK9y04gW3JK/5lobq5ORebolcsHlYBUvpNeIPjupLQwGvz/TPtrLRNGLqDC
	rvsM6OA2XbQ2bwzxWaSQS3ImE2O2iXOZn9HhThMGeDB4Nff3fgUvXOTDIrgWOn9K2DgLL7Yc
	zkUIlFdj+Nraksd/7BSk8oH6tjeBVhFqSFvKta9QxWgdr58oPaTYaW/xNqUjlLrbJuMw/MSe
	xzuYfdfDfm6J8kRjMOnwQ0n8svJElzqAk+d83ow38gpGQ+LkjGgnf8ZFJ4rUJFADroX3ABEB
	AAG0JU1hcmsgSGF0bGUgPG1hcmsuaGF0bGVAd2luZHJpdmVyLmNvbT6JATcEEwEIACEFAlYK
	xFgCGwMFCwkIBwIGFQgJCgsCBBYCAwECHgECF4AACgkQfv796/r0vvlvZAf9Gs+eN320yhRW
	V/fZCsngKhmOK4v3HrTwFrkSmoD9QHQiE/5IPdNacHwIPwZx07tNBohB8xOeNqCPRYRBwGhA
	AnxKOPyd0nnm6ZhPzbA57v4x3IGRQr4QzvcBTASJq91l3Ew4lpAslyx5w1DPPqRD7G8ycDKg
	peKyDwmdkvCunVisSAQI3XIMq2y230biTO98tDPEezg+lg+yTsz9ZT33F5KNuWrpf8VL5fG/
	mt+kAv7wtsx/KTRbqhH3iFXF6eBSwMjAfTXFlkLfbM9riJGXrWEl9n2S2R3cDHNHug0lb8f4
	whK370KEO4OwRKIYW/VUBmzk5XZUE9DTlDSV8ycsrrkBDQRWCsRYAQgAwK3FuHCE+HW3YWdH
	PUjeSn5p//xJ57u8g2rng8zm9zNjmYgpPv5UxozaD9i2jf4mlQLHGGOezhHae8K4Nj70oVcv
	8AmwcrJa9i9WL1oy/9R3fHMWf/Ctt9VXTO0qlCuq6PDzaUfvsXR61aJIjTKNQTOjCLjY1vXm
	VSewUgARysmA8WrjTfwGBihMBxAX0+kIjx8nOlam0WvekMBXZ0AbS56oTLRxYao6DI3GeB/N
	oWPy/5DfuTKaSdM0Pf8al20x9RuNN5/HLMlyDH/k8bIa1xd9aAqW+Feiw5gC107V2E6ULyIy
	q6em2UrsmIRxrvpHqbNgQKqvTehJ+V/i4g/uOwARAQABiQEfBBgBCAAJBQJWCsRYAhsMAAoJ
	EH7+/ev69L755XAH/3ZcNhooqd9OBhFkvXm1iWZ8EoC7motWqVn2oEyxoonsg8AD9kFXiN+T
	dYp7dH99EZu9q4ptj56AXm4uHzOgywL/5/V2TY6twCGAjUGzDjAB5gzoi+JLIBlDiyOip0eL
	QswIhRk473xy3j8DA4oVamnSPWgyNJ+qsdt37YWDzoDFFvtDoRU7Eb+znfIMDKzlny0XU/8L
	cW1bNHJlpv/78GPdfP4tjysEd8MuA5jf5o5w4XqcwTqalffEJtQ/s3pbkstEi7qm5uPui5Kt
	gq6YYLSqcSNe0GWAF9/T+qwyo7burSTxUWCWtMmlXdAQLW9SynLhB3Jbch0nFAh0fCKi6yY=
Organization: Wind River Systems
Message-ID: <29749ef2-06ce-3665-d47f-cee4048653b1@windriver.com>
Date: Wed, 15 May 2019 21:27:37 +0300
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.14; rv:60.0)
	Gecko/20100101 Thunderbird/60.6.1
MIME-Version: 1.0
Subject: conf/layer.conf is broken
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
X-List-Received-Date: Wed, 15 May 2019 18:27:54 -0000
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit

A recent commit:

http://git.yoctoproject.org/cgit/cgit.cgi/meta-virtualization/commit/conf/layer.conf?id=032ef5310419563a01baad0b1b94e4587d12f777

refactor for YP Compat for PV changes
Only include our versions of recipes if virtualiztions is in
DISTRO_FEATURE

Signed-off-by: Armin Kuster <akuster808@gmail.com>
Signed-off-by: Bruce Ashfield <bruce.ashfield@windriver.com>



Is not working the way that it looks like it should, specifically there are two
issues:

require ${@bb.utils.contains('DISTRO_FEATURES', 'virtualization',
'meta-virt-default-versions.inc', '', d)}

First issue is that the 'meta-virt-default-version.inc' file isn't in the same
path as the layer.conf, so it really should be
"conf/distro/include/meta-virt-default-version.inc"...  but you may be wondering
why nobody has complained about this.

The 'DISTRO_FEATURES' will -never- contain 'virtualization' unless the user
calls this from within the toaster or uses bitbake -r <config> to build their
system.  The problem is that 'requires' are evaluated IMMEDIATELY, and
DISTRO_FEATURES is not set in the layer.conf path.  It's set later via
distributions and such by the eventual load of the bitbake.conf file(s).

So there is a trick to be able to do this.  You need to find a way to 'late'
load these files, AFTER bitbake.conf is loaded.  We had to do exactly this from
within the meta-overc/meta-cube layer:

https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/conf/layer.conf

You will see at the end that a variable is set to the config file to load, and
that the USER_CLASSES is appended with something that (CAN) check the
distro_features -- because it's resolved 'later'.  Then the class simply does a
require bringing in the configuration itself:

https://github.com/WindRiver-OpenSourceLabs/meta-overc/blob/wr-10.19-20190121/meta-cube/classes/cube-cfg.bbclass


meta-virtualization SHOULD be able to follow the same approach to be able to
make these adjustments without breaking any of the Yocto Project compatible
guidelines.  (Unfortunately I don't have time to work on that myself right now,
but hopefully someone else can step in and fix this.)

--Mark

