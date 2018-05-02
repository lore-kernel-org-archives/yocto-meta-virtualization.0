Return-Path: <kurt.bodiker@braintrust-us.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 2912EE009AC; Wed,  2 May 2018 06:08:46 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.6 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,RCVD_IN_DNSWL_LOW autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.7 RCVD_IN_DNSWL_LOW RBL: Sender listed at
	http://www.dnswl.org/, low *      trust
	*      [209.85.214.50 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
Received: from mail-it0-f50.google.com (mail-it0-f50.google.com
	[209.85.214.50])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA31FE00831
	for <meta-virtualization@yoctoproject.org>;
	Wed,  2 May 2018 06:08:44 -0700 (PDT)
Received: by mail-it0-f50.google.com with SMTP id n202-v6so16696131ita.1
	for <meta-virtualization@yoctoproject.org>;
	Wed, 02 May 2018 06:08:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=braintrust-us-com.20150623.gappssmtp.com; s=20150623;
	h=mime-version:in-reply-to:references:from:date:message-id:subject:to
	:cc:content-transfer-encoding;
	bh=tRAti3VVkbalKNonnXMmDpSC+jCKMx4J9S8rZlXIbHQ=;
	b=Lj0p3N27wH1Hv3cRDIFmPOkkeBxNgMW1emnrFQWGR2MbfMbLPBx+mYSFqPVYFMdj02
	6GKbttpottxtxyED0L13qaUvTnZv49NWyFHfbal2t+3EyjECOaoY3xSxHoRLacl2tj+f
	nIxRuZmrwdou6UxyU7pPKQemxnmJLc7jl97OImdImfua/qHHTGx99olWjKMf+RUtaj3E
	zXybgcMorFW1bAnldD0H0KXOaP3FdpDiQ23hKjpkzi3VNxhKk3VD3anLDi0boeNp5wzp
	Ll7/aHzXgxJ6QyRpysl9437esSTgMaPgACvKRQ1Cn86Y2mUKGVkie8IrhARVG8au4B0r
	D6Cg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:mime-version:in-reply-to:references:from:date
	:message-id:subject:to:cc:content-transfer-encoding;
	bh=tRAti3VVkbalKNonnXMmDpSC+jCKMx4J9S8rZlXIbHQ=;
	b=I0ySQTwIiBEUKvbY0gCK/JZ30g1t9YgLJ8IaOF9p0dJE8OqDr1wydDyFL4+sgFrkvW
	9KMToDBfzTmO+VicgvIqy1MODxlbbme8izE4fCwW8otrE4c+X1DFoIR7MyfnF7AJ+dBU
	WirlktPA9hDwWsUeC0u6+RP+etTduFBjmkohJAzF1rfMwbKz/NTewtgj4ggYguSZe73+
	dbuk0pHiMxpt8xcNg/ALjapLjDdwjCXBzeC6MzmqfcFsUr23mV7vBfTOgc/XdxhDbVS6
	HXJU0fGb08Xxtat952/EYiBZH0kxNbxye9AKHeb1z8nTIdidAs7WThB38cnRzWoG99gW
	mTHA==
X-Gm-Message-State: ALQs6tAOEoeZRwArV1mkJbDbQD8dZL87bhFfvt7lpiUceScGfKombIUn
	rq5vHS5p37Nnyi5u9gdQNSgRKSxWQiihdxCkTD5/Y94RacKq3Q+5tzGWEXlw5o1EMd7k1UDCSxv
	yW5k8pqxkf5a0Hfj2pxjepm31kXoMsjeZ9BBEcb+Wgfa8
X-Google-Smtp-Source: AB8JxZptTkG+D5U84UO1DxTKFiArIhDr9h0WxdBHXiQLtbyL+mN8dowwUjD+fFX3DaJNFQvxtA6FlurlUEQAhgv0Kqw=
X-Received: by 2002:a24:64ce:: with SMTP id
	t197-v6mr18870421itc.91.1525266523932; 
	Wed, 02 May 2018 06:08:43 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a4f:4092:0:0:0:0:0 with HTTP;
	Wed, 2 May 2018 06:08:43 -0700 (PDT)
In-Reply-To: <CADkTA4OtS1rR9pcX5EHM5He_b0-zi3fZJw6AQp1hjY5R6ro_oQ@mail.gmail.com>
References: <20180427164443.8590-1-kurt.bodiker@braintrust-us.com>
	<CADkTA4OtS1rR9pcX5EHM5He_b0-zi3fZJw6AQp1hjY5R6ro_oQ@mail.gmail.com>
From: "Bodiker, Kurt" <kurt.bodiker@braintrust-us.com>
Date: Wed, 2 May 2018 09:08:43 -0400
Message-ID: <CAGfCXKEWiFxVfSQcvi34aFeULcMA8Zegx5+BLSfLpw2NGmxjYg@mail.gmail.com>
To: Bruce Ashfield <bruce.ashfield@gmail.com>
Cc: meta-virtualization@yoctoproject.org
Subject: Re: [PATCH 1/1] xen: TPM Emulator: Corrected license from GPL to GPLv2
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
X-List-Received-Date: Wed, 02 May 2018 13:08:46 -0000
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Bruce, I squashed that patch into the v5 series. Sorry for the confusion.

Kurt

On Tue, May 1, 2018 at 11:18 PM, Bruce Ashfield
<bruce.ashfield@gmail.com> wrote:
> After merging your v5 series, this doesn't look to be needed. Let me know=
 if
> it does still need to be applied.
>
> Bruce
>
> On Fri, Apr 27, 2018 at 12:44 PM, Kurt Bodiker
> <kurt.bodiker@braintrust-us.com> wrote:
>>
>> TPM Emulator is licensed under GPLv2.  Bitbake does not consider GPL a
>> valid license, so it throws a warning.  Fix that.
>>
>> Signed-off-by: Kurt Bodiker <kurt.bodiker@braintrust-us.com>
>> ---
>> This patch is to be applied after applying the Xen vTPM patch series. It
>> corrects the license applicable to the TPM Emulator which I had
>> incorrectly listed in the recipe as GPL to the correct license type of
>> GPLv2.
>>
>>  recipes-extended/xen/tpm-emulator_0.7.4.bb | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/recipes-extended/xen/tpm-emulator_0.7.4.bb
>> b/recipes-extended/xen/tpm-emulator_0.7.4.bb
>> index 7207676..f626929 100644
>> --- a/recipes-extended/xen/tpm-emulator_0.7.4.bb
>> +++ b/recipes-extended/xen/tpm-emulator_0.7.4.bb
>> @@ -3,7 +3,7 @@
>>
>>  DESCRIPTION =3D "TPM Emulator"
>>  HOMEPAGE =3D "http://xenbits.xen.org/xen-extfiles"
>> -LICENSE =3D "GPL"
>> +LICENSE =3D "GPLv2"
>>  LIC_FILES_CHKSUM =3D "file://README;md5=3Deeabd77cf8fd8a8bc42983884cb09=
863"
>>
>>  SRC_URI =3D "\
>> --
>> 2.14.2
>>
>>
>> --
>>
>> *This email and all attachments are considered confidential and the
>> proprietary information of BrainTrust Holdings.  Unauthorized disclosure
>> is
>> prohibited.  *
>> --
>> _______________________________________________
>> meta-virtualization mailing list
>> meta-virtualization@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-virtualization
>
>
>
>
> --
> "Thou shalt not follow the NULL pointer, for chaos and madness await thee=
 at
> its end"



--=20
Kurt Bodiker
BrainTrust Holdings
www.braintrust-us.com
443-296-2186 office
410-750-2119 fax

--=20

*This email and all attachments are considered confidential and the=20
proprietary information of BrainTrust Holdings.=C2=A0 Unauthorized disclosu=
re is=20
prohibited.=C2=A0 *

