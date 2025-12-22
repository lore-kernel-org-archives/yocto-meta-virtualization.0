Return-Path: <vudupa@qti.qualcomm.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 607DAE6748D
	for <webhook@archiver.kernel.org>; Mon, 22 Dec 2025 06:18:59 +0000 (UTC)
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
 by mx.groups.io with SMTP id smtpd.msgproc02-g2.75551.1766384335250137238
 for <meta-virtualization@lists.yoctoproject.org>;
 Sun, 21 Dec 2025 22:18:55 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@qualcomm.com header.s=qcppdkim1 header.b=DWeoyVqn;
 spf=permerror, err=parse error for token &{10 18 %{ir}.%{v}.%{d}.spf.has.pphosted.com}: invalid domain name (domain: qti.qualcomm.com, ip: 205.220.180.131, mailfrom: vudupa@qti.qualcomm.com)
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 5BLLJ7uO3935865
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Dec 2025 06:18:54 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=Aqae17E0jCkL+/WZDYYo8sP0
	o6+7v+HQ0VnSxd0EMxc=; b=DWeoyVqnO3p40FKERaVxt6evROnG6m8wczLvmV++
	QiO36+ksTPGrnWwQrfStm9TzxAkR3hNt2Wt1sEPqKAkoAIu1Qg7KuX2RGeQM/nrd
	YfkBq92z+NfKZyF1QJrzl/5L7RAq3CodV2Yj5yBJherYRavuzkaW+llPTT77sxGG
	/Lo6TAu5T/yvv3I22eF7MR2ZbeIKbQC+ufQqIM8Ah7y33cp2fl6dtdl0pYHgI/z9
	DZea/ZxrBlJ3bzR7MWVUp2GqyOKpOxeqKHkA5U1VbuonyNaCC4BrtTzHmIig4uEX
	6dddzo/iWQgHMvoliBuAYgaBbiJS+V6FrYjjS5OqKAlcBg==
Received: from bl2pr08cu001.outbound.protection.outlook.com (mail-bl2pr08cu00102.outbound.protection.outlook.com [40.93.4.10])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4b5mvfkw2r-2
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT)
	for <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Dec 2025 06:18:54 +0000 (GMT)
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=Qa8rswhWNajAX5aVymGHJB1c4sWwYtUYqs/KzvzMKHQRXHaM/ah2YGWjRvaXzn13Ecf9EpWaZu+aMKznVKbCZ/bfhK9FL2CBCYpRoAkNvj3MEmlEqfZhXE5DmqhEN9vHHvSA9FUjBRwQnAddnhnowiM+AVcurExevCL7BvezBOu3QviGHrVfDkmcI5kdr8FPkxSq07ZbXN47sbR9ZQfxjtE3fPDN8PvxddD9DUbTgL4ZGjPJUaU1Vt27cinXvik8Tu6KK8GVYH9fZgZI22utKXfvVBYkJsSeMoaH1zvDbDItZKkodZGfDMLAjlvjpCr1nG4iQ0AkylDRCWfZbqD3+Q==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=Aqae17E0jCkL+/WZDYYo8sP0o6+7v+HQ0VnSxd0EMxc=;
 b=Tk1JfTpAuWRkw4GGZECs2mWzb03F8szjebgJfbyNqyuLw1BPG8trFN7lYG/T3lOLR1aU0i18AZjzyWER2+Mn757xGuiG9Bd+nhxiIn79eoXcn7YvlD+oIFxUl2n8c+O2Znrzcr/cophByO9zOmoy2Empg6+eCocJvb2FgV9MlJOpsnLYWNz/Mw2+tdrh6zSSx6ZyaONEjen4FKVlIOGoGl8IPgVOkikmfvaAwHR7zxGdv4E+JHX7rW3All2vpHVjCjL4oySHukRneAw+JS2zCeJ6ye+Xg3Am057W4AWc2ek4gYYKfCyqDdg+sURw2/CQ988enobrrHM6oCe1IxNSow==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=qti.qualcomm.com; dmarc=pass action=none
 header.from=qti.qualcomm.com; dkim=pass header.d=qti.qualcomm.com; arc=none
Received: from PH0PR02MB8796.namprd02.prod.outlook.com (2603:10b6:510:f3::9)
 by SN4PR0201MB8807.namprd02.prod.outlook.com (2603:10b6:806:202::9) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9434.11; Mon, 22 Dec
 2025 06:18:50 +0000
Received: from PH0PR02MB8796.namprd02.prod.outlook.com
 ([fe80::732c:e5b4:428a:8931]) by PH0PR02MB8796.namprd02.prod.outlook.com
 ([fe80::732c:e5b4:428a:8931%4]) with mapi id 15.20.9434.009; Mon, 22 Dec 2025
 06:18:50 +0000
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
To: "meta-virtualization@lists.yoctoproject.org"
	<meta-virtualization@lists.yoctoproject.org>
CC: "anuj.mittal@oss.qualcomm.com" <anuj.mittal@oss.qualcomm.com>
Subject: Re: [PATCH v2] lxc: delete empty lxc state directory
Thread-Topic: [PATCH v2] lxc: delete empty lxc state directory
Thread-Index: AQHcZOlwOFtAklbedkyRuS7yGquFSLUtSoy+
Date: Mon, 22 Dec 2025 06:18:49 +0000
Message-ID: 
 <PH0PR02MB879642E5EB65B35A4CE40540F1B4A@PH0PR02MB8796.namprd02.prod.outlook.com>
References: <20251204064329.568898-1-vudupa@qti.qualcomm.com>
In-Reply-To: <20251204064329.568898-1-vudupa@qti.qualcomm.com>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
msip_labels: 
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: PH0PR02MB8796:EE_|SN4PR0201MB8807:EE_
x-ms-office365-filtering-correlation-id: 6740479d-ad65-4ba9-c1fc-08de4121f8f9
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: 
 BCL:0;ARA:13230040|1800799024|366016|376014|38070700021|8096899003|13003099007|7053199007;
x-microsoft-antispam-message-info: 
 =?iso-8859-1?Q?INl4e2qYeBBTJhMNm79nJeQtmewgdx2RrNzEd8rC4OGfwi3LIefqmP2s4j?=
 =?iso-8859-1?Q?4B9cMuSwCiiXkZwaDTHTye8tegQPOtJDqEffVtuNbdMmLQdhRD2KlzhwIr?=
 =?iso-8859-1?Q?nxPfJbwJkowWHfxi3nDmawukHVFfZk2CLFSeRmGt1kgwyEZCpmu7dWEOz4?=
 =?iso-8859-1?Q?BacGASFS3vGq07KUz8lvz4hzf9Ed1i7qGRJjmMiT87WWFxtj/Hj/8SnZpb?=
 =?iso-8859-1?Q?4TWscUY9e36PLEkPse74sEIYgeJNDmP3cNtidnyh5uytlY+4FwQJkbxBQM?=
 =?iso-8859-1?Q?UPWwyCw9THEYuJY3AuefTzTJAk5gtAdi/Fu2as0GSvJ1Z70xhspjuwO4sE?=
 =?iso-8859-1?Q?2x7LPFNVX2YQYVqugbQ2hUMyHI+9xU1vWLtlTXp0mK+rohEtsv6ZfSjRan?=
 =?iso-8859-1?Q?/PkgML9fAzKnVRIccJa3Dl0NByCf/xX8Ahhirplzh7iXQLtLkHmHrYaocv?=
 =?iso-8859-1?Q?xBTN6ZeUoLOnkX0D/HuAtLqtT+RrBkzmgaLXdaX2uoZzNpADwV9CN4h1xY?=
 =?iso-8859-1?Q?fsqRvzXhtSGnvoO1ZneR/Xy0TETly9EumT7Kwdf+m8dXgpbXq8ndamHvgT?=
 =?iso-8859-1?Q?qlwsVAW+8kH4ReVBTgIS7xXfh2amBWYwZkTFtFfSyGyuOpjfCil7lrvcPj?=
 =?iso-8859-1?Q?CChr2F1EcShELl6wruru3rGTZimj9llZPxpdRBarqF1SvzdHlBZ6Vq2irQ?=
 =?iso-8859-1?Q?rTAjj7M24r1aHxKRtcKENhOEyU0jELwIORydn0x1HVvsgw04EPaaa7lG83?=
 =?iso-8859-1?Q?WHM/CwGdELDLUenS5QmSMCgNBKcHKDCoLoikRk61k2q6fOB6bwWY1/D2Dl?=
 =?iso-8859-1?Q?Ay3ECzf2oHe6nqNyv7K1NfL880ZGpAzf45i+DAY+9JGFC1m0tiI3yTomXw?=
 =?iso-8859-1?Q?yCKGPiO+LJ0RQGziE6EA6KQvaKnpm90QTdC+0vSpLFu8Ds7RzfpTP8qp6L?=
 =?iso-8859-1?Q?2IGAgLOaJoPyMiJNOBpL1VLyGTAd9gWRSw2LqozV1ZOOERPOV3pZA0f/B5?=
 =?iso-8859-1?Q?9AjfLitGoo9h5w413YzwjyNoK+hzlSE/ITcStfbWslQcZn/ATS2TLVF53k?=
 =?iso-8859-1?Q?FwSLW4H0EJSiWxoGj80i7ghfEbY1Y2vHz42EDQxaNow1r1xMCAzhRzHIRB?=
 =?iso-8859-1?Q?NNteNWCERSff9kAvsc93zYiLXaUINeBAL7zZWrkJI7InFKjvDN0RtUTtu8?=
 =?iso-8859-1?Q?au/M9ohEbPfmTPEjQAnoWpWPxsg4I33jE3ItwBhj3V9fG16KTtcmXUfEbP?=
 =?iso-8859-1?Q?PqIk4A9GlHyKVY0IGpFNHFS8xDgdgprtWd3kwd2mXnEUWTAFnySkWD1dF1?=
 =?iso-8859-1?Q?eOECdrnuKG6Vx9vmbMrDgzJOrRzHJVOfhB4G9AcTnyjPBd+J4hSPf2Z0oQ?=
 =?iso-8859-1?Q?yW2aWP1m8tkiKKdSzf76TcrnEJhm2O+x+SAu5FXZiGRFSmS7fzKCXSut8Q?=
 =?iso-8859-1?Q?4/klNBOlbPf3NXAqniMcbIB4Q5Y0OjmhAbe07Ly5PDGmPiWy0x9ENJWi3L?=
 =?iso-8859-1?Q?8ENOBBrAizxqeL4aM3YDJsl7htow1g7bX+wF2O8wnM4w64zhTqzNnH4kyw?=
 =?iso-8859-1?Q?qevZ1G8PLpU9xQRCMYy3xMB5BbRL?=
x-forefront-antispam-report: 
 CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:PH0PR02MB8796.namprd02.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230040)(1800799024)(366016)(376014)(38070700021)(8096899003)(13003099007)(7053199007);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: 
 =?iso-8859-1?Q?jEMRBs79GDhh/x1Zpva1ap9qCl4vnXXFSZGSWM0kRNfKaGEyB3MUy7ES4m?=
 =?iso-8859-1?Q?UMGiPIgiX/P/0eWiAlXHutz1YKF/7IvpVT54qIVFzcGDSbnRlua0g0VxT3?=
 =?iso-8859-1?Q?ibuwdE0sTw49SN2G8f9IJOcdOG5nGJnmNvUo6WZLwhf5DIMihQbTc382UF?=
 =?iso-8859-1?Q?q8f4hOKUeIDp3eG8dsfUQDLFM0FiWq78LpJ3BQvdqeX8OoZsBh5GTL96e5?=
 =?iso-8859-1?Q?Zy8alej341ipk47pIWeQ+iXhQyZt9P6ofRHQuOwRTbr66gENWmmkIeQUrL?=
 =?iso-8859-1?Q?mmo5tEo0vk6A6s0zq2mVE0qM66ZZlLnUmalQu+OmsKE6P2oC2Ql7/meJj5?=
 =?iso-8859-1?Q?H9f8TXQrf73K8GnAn3zgq23XJYTg/e6JXEPQKU7DnUmXZf5n0DHrtA/pyV?=
 =?iso-8859-1?Q?PAJYOKIAPFh9MJyjkdjqtv3ttJ54Ox4ROXXLJEmsLYqVLSr1eOFXl6sgF5?=
 =?iso-8859-1?Q?dGKGxxcc54tgBP59QKJ4VPQzxayRApxVOmRBy5/HtC+Hw0N76ZuVYFQIi8?=
 =?iso-8859-1?Q?DqezFGqld/mpa6/iFELUwZvpiW1RmqEIMb6ZdkUctaPtZlvIeo3x+7VV+b?=
 =?iso-8859-1?Q?X/lPcjR9V/o2W6fGlB1mWF+X4eLWRQrzz1v9an5I05fJA6M+P/EI8+hyx3?=
 =?iso-8859-1?Q?27/2J1FvgVzh+G2UOveVRUXU8ooUNObg6NTa40OOkf5mZklc4pcNVjFz+X?=
 =?iso-8859-1?Q?JEicfPjQUdLCL7Zcwtc7VFhTwUf9r78a3kc5CNi9aD2ei0GAvMHNBy+fcd?=
 =?iso-8859-1?Q?P5rrpNt9aWNrBEM35fWnbngRXOV0T0FdAr9vAh2TtvSYA3gN3rhZ+MlRL+?=
 =?iso-8859-1?Q?QKK+cSkvMCTKs6OxvErcxzoD/9a+Cxzsn51bNeuUm3FklOUMALTLAeeul5?=
 =?iso-8859-1?Q?43BlkYVry5ANRL1hYG8c9Cr70aINQtlTF+TP47Atds4o9MXZRTGQJmnTtg?=
 =?iso-8859-1?Q?ORUNyhseMZGLLHdH+2RUZuNRlZ4JMap17LziDIKZIUbabRMtk2Xz6OtMRA?=
 =?iso-8859-1?Q?AcSSWWZJu88pvItNSl602e39MOew9Q2nGRCrmzBcc3wzV9suOKYzTgwLHM?=
 =?iso-8859-1?Q?cgX7p+QAGfZjjLGKisVo9D2WaJ3NPoIr+WHSuQi34+ypi7xio0picRR6wj?=
 =?iso-8859-1?Q?zb29izv8iiCNZ6RSacOjA+4zEU0mB0lLgHP+ymKy+Uluk3NpgIwmGWdzv5?=
 =?iso-8859-1?Q?rFVKz23USDn0FtPsVFdf13qZmUi2mkLO94BNIrxy9THUiAHYNLqN/aNbOO?=
 =?iso-8859-1?Q?ThrfNyey6QpZTNVoN6PefMTUswPdqPp29rdBQIOpqg2yxoQ8EO5XiwPDBM?=
 =?iso-8859-1?Q?q60r9KKzfkEt9yTkFIN5MBYNUzkoMIBs3esLHIRBIjzcgFeALZkBZ8SAzr?=
 =?iso-8859-1?Q?SmCkC3iciLMjTJv27Cab/sajU8H+65TsnBRzAF6aSWhJj3O9YG0/nnfJ7/?=
 =?iso-8859-1?Q?3Ugl8pfeShT37DCSLRVSSfRn7ojDemqzVJrKrOpFyzoVn5ahWt+g2WP0s2?=
 =?iso-8859-1?Q?ucdeHq1gnH1A9XMTFgyzTOApL87fJ3K+iYSRuPQxkpoeqVcrHxyviqes9v?=
 =?iso-8859-1?Q?l0lQ6k8ZFlo7hvNADRg51ePvs2bY59PnJZEmAd6d2iR2SCanQlf68xKG5B?=
 =?iso-8859-1?Q?Gxd3inPQUByveIfgk1B9Xs4KB3yNWNscbeBZv66ZLGmu7KxTaO7z2gUYrg?=
 =?iso-8859-1?Q?+HDKZykc4+uJa6/DfUpyYw4t+d0JAcgSUyt4PbdqYO8aUariC04gCY+HGR?=
 =?iso-8859-1?Q?VV6lvdioRImfg30MCR7y84V3ptzGhA+p1gIDvJ2umeU+lik1aI7qh80dgR?=
 =?iso-8859-1?Q?OHHdo5PWoA=3D=3D?=
Content-Type: multipart/alternative;
	boundary="_000_PH0PR02MB879642E5EB65B35A4CE40540F1B4APH0PR02MB8796namp_"
MIME-Version: 1.0
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-ExternalHop-MessageData-0: 
	XlsMX4oOjpNg4AtVyBl72CwBhRBjiHD5EOtiY28LLtv1OUhFlcAS7rmJwvMKqcpeWMkMwY0sYAFF0sIxcReobhcGbH62Ev2WfIs2QS+xp2Ms6Fl2xdQdnSCSvSywvZ5Jx9YtgZ611xJA8PVDOIjKYSPxeZmA0OYwDrqTc0mD2o05Q6yR/1yNl/AXx8PlkMgpC2EhizJat2KAz/TLbt1G3NDBTpbsxWGTWahgUKMJdVk5m44C+lN/5Yqifo8s96vIchyqJznk1APUqCIIhgwhvPNiPcljsPWRLjHNoZr7qPbkA1gel9olQtFlbrp0nUoKu4oDxaPhMl97ANwwfyCTqe55w+RGWqWKVtMYet31UFYCLOw6e8zOL7AznNrvRtpYmbOAFwJFTwiilLPu5r7EL81+NUg1V+UR3LAADPbEWnSbeEVJ/mCoKVlwhtZtJzSw5dVjIGuyrW+YR+86c7fsSjuGGbuV1IRVLEJclUp0SRHHBOrRAycBcZ7qo9HHbuNyqMw7+MnR9/5k0FCMtqZdgZa3qQyNcbHy+G4W9ZLN7HcBsnm/LB3vX6TU9C8zxy7n9TrAzbZgntPKoWIz9AMyJ0MmBWbIVguH8hrMEAb0a5E25B/M9LKP6yW0E4ivb3Su
X-OriginatorOrg: qti.qualcomm.com
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: PH0PR02MB8796.namprd02.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 6740479d-ad65-4ba9-c1fc-08de4121f8f9
X-MS-Exchange-CrossTenant-originalarrivaltime: 22 Dec 2025 06:18:49.9523
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 98e9ba89-e1a1-4e38-9007-8bdabc25de1d
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: CgsFEnHbDnl2pcjO0kFndIzUSMlM7QL447jEc3+IcQt+/oEF2gI2HVvGImowF5iRfRA3qkIzHv9YQ8+40mfVgw==
X-MS-Exchange-Transport-CrossTenantHeadersStamped: SN4PR0201MB8807
X-Authority-Analysis: v=2.4 cv=H8rWAuYi c=1 sm=1 tr=0 ts=6948e2ce cx=c_pps
 a=Ycvd2K91t9vP77DbJT42RQ==:117 a=z/mQ4Ysz8XfWz/Q5cLBRGdckG28=:19
 a=lCpzRmAYbLLaTzLvsPZ7Mbvzbb8=:19 a=xqWC_Br6kY4A:10 a=wP3pNCr1ah4A:10
 a=VkNPw1HP01LnGYTKEx00:22 a=NEAV23lmAAAA:8 a=EUspDBNiAAAA:8 a=iGHA9ds3AAAA:8
 a=mpwEcIy0aCt1yPnPy6YA:9 a=wPNLvfGTeEIA:10 a=tcb9jNzHF7sAsFsct-IA:9
 a=lE5iO3e31czx94Ml:21 a=frz4AuCg-hUA:10 a=_W_S_7VecoQA:10
 a=nM-MV4yxpKKO9kiQg6Ot:22
X-Proofpoint-ORIG-GUID: UGsR_Iq_gGO3bOxfMbdGi42Zgb6ZO-oM
X-Proofpoint-GUID: UGsR_Iq_gGO3bOxfMbdGi42Zgb6ZO-oM
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMjIyMDA1NCBTYWx0ZWRfX+Iz9N2fwIYOv
 S/PmSkWMn2Rkk46uUcQ6e85ymeeZ2eIZbrg5NgDnLmCeT+zISUwC08lWF0IEfv1bkzxS07CFS1m
 rC270k53cAOBKTX5jLe0yhmHJQBRzTlfxgyijnHTWJIvPSWQ3UGcooy9FtuoWS72TOWXc4mTchi
 jEX+WOk++IfVOjWU+ZbDJAb/uBGH5zrewFh1niHKA+t7mHBdDFVAGie9p/9LFNQOrl9oSkEYPkK
 KF/F7u6yqokQvJ6LI5gb12BCTi5y1hyDZyVYaifggxmrZYXlG2axjvfPhqEy50Y8HwoNP9XdkCN
 efCU6AD5AssVTrJ6wjePg8/i8bdbARoHx8MvSCfjKUIrnIa9KeDeEBofwipsg0bHOnLgFqJqKeG
 q8Q9i+Z3QG2WdwtLAUWYtqsOEFHHHcaFkR74/rFdLPOltxSYFsp/khKnrhpz4L8qbqwXtU7J3AL
 vpSEd4Ha7/tprHmjjQA==
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1121,Hydra:6.1.9,FMLib:17.12.100.49
 definitions=2025-12-21_05,2025-12-19_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 impostorscore=0 bulkscore=0 spamscore=0 adultscore=0
 clxscore=1015 phishscore=0 lowpriorityscore=0 suspectscore=0 malwarescore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2512120000 definitions=main-2512220054
List-Id: <meta-virtualization.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-virtualization@lists.yoctoproject.org>; Mon, 22 Dec 2025 06:18:59 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-virtualization/message/9496

--_000_PH0PR02MB879642E5EB65B35A4CE40540F1B4APH0PR02MB8796namp_
Content-Type: text/plain; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

Is there any feedback on this patch?
Could you please merge this.

regards,
Vishwas

________________________________
From: Vishwas Udupa <vudupa@qti.qualcomm.com>
Sent: Thursday, December 04, 2025 12:13 PM
To: meta-virtualization@lists.yoctoproject.org <meta-virtualization@lists.y=
octoproject.org>
Cc: anuj.mittal@oss.qualcomm.com <anuj.mittal@oss.qualcomm.com>; Vishwas Ud=
upa <vudupa@qti.qualcomm.com>
Subject: [PATCH v2] lxc: delete empty lxc state directory

lxc systemd service [1] defines a StateDirectory to ensure that
the /var/lib/lxc directory is automatically created and managed
by systemd during service startup.
Do not create lxc directory at build time for systemd.

[1] https://github.com/lxc/lxc/blob/f9ff9ea2a92653a823edf25e8e28c9dab08b309=
0/config/init/systemd/lxc.service.in#L16

Signed-off-by: Vishwas Udupa <vudupa@qti.qualcomm.com>
---
 recipes-containers/lxc/lxc_git.bb | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc=
_git.bb
index d6f137d3..542134db 100644
--- a/recipes-containers/lxc/lxc_git.bb
+++ b/recipes-containers/lxc/lxc_git.bb
@@ -141,7 +141,7 @@ do_install:append() {

         if "${@bb.utils.contains('DISTRO_FEATURES', 'systemd', 'true', 'fa=
lse', d)}"; then
             # nothing special for systemd at the moment
-           true
+           (cd ${D}${localstatedir}; [ -d lib/lxc ] && rmdir -v --parents =
lib/lxc)
         else
             # with meson, these aren't built unless sysvinit is the enable=
d
             # init system.
--
2.25.1


--_000_PH0PR02MB879642E5EB65B35A4CE40540F1B4APH0PR02MB8796namp_
Content-Type: text/html; charset="iso-8859-1"
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Diso-8859-=
1">
<style type=3D"text/css" style=3D"display:none;"> P {margin-top:0;margin-bo=
ttom:0;} </style>
</head>
<body dir=3D"ltr">
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Is there any feedback on this patch?<br>
Could&nbsp;you&nbsp;please&nbsp;merge&nbsp;this.</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<br>
</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
regards,</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 11pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
Vishwas</div>
<div style=3D"font-family: Aptos, Aptos_EmbeddedFont, Aptos_MSFontService, =
Calibri, Helvetica, sans-serif; font-size: 12pt; color: rgb(0, 0, 0);" clas=
s=3D"elementToProof">
<span style=3D"font-family: Calibri, Arial, Helvetica, sans-serif;"><br>
</span></div>
<hr style=3D"display: inline-block; width: 98%;">
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<b>From:</b>&nbsp;Vishwas Udupa &lt;vudupa@qti.qualcomm.com&gt;<br>
<b>Sent:</b>&nbsp;Thursday, December 04, 2025 12:13 PM<br>
<b>To:</b>&nbsp;meta-virtualization@lists.yoctoproject.org &lt;meta-virtual=
ization@lists.yoctoproject.org&gt;<br>
<b>Cc:</b>&nbsp;anuj.mittal@oss.qualcomm.com &lt;anuj.mittal@oss.qualcomm.c=
om&gt;; Vishwas Udupa &lt;vudupa@qti.qualcomm.com&gt;<br>
<b>Subject:</b>&nbsp;[PATCH v2] lxc: delete empty lxc state directory </div=
>
<div style=3D"font-family: Calibri, Arial, Helvetica, sans-serif; font-size=
: 12pt; color: rgb(0, 0, 0);">
<br>
</div>
<div style=3D"font-size: 11pt;">lxc systemd service [1] defines a StateDire=
ctory to ensure that<br>
the /var/lib/lxc directory is automatically created and managed<br>
by systemd during service startup.<br>
Do not create lxc directory at build time for systemd.<br>
<br>
[1] <a data-auth=3D"NotApplicable" class=3D"OWAAutoLink" id=3D"OWA5a56119d-=
eea9-4b56-143e-a616f2d66dd5" href=3D"https://github.com/lxc/lxc/blob/f9ff9e=
a2a92653a823edf25e8e28c9dab08b3090/config/init/systemd/lxc.service.in#L16">
https://github.com/lxc/lxc/blob/f9ff9ea2a92653a823edf25e8e28c9dab08b3090/co=
nfig/init/systemd/lxc.service.in#L16</a><br>
<br>
Signed-off-by: Vishwas Udupa &lt;vudupa@qti.qualcomm.com&gt;<br>
---<br>
&nbsp;recipes-containers/lxc/lxc_git.bb | 2 +-<br>
&nbsp;1 file changed, 1 insertion(+), 1 deletion(-)<br>
<br>
diff --git a/recipes-containers/lxc/lxc_git.bb b/recipes-containers/lxc/lxc=
_git.bb<br>
index d6f137d3..542134db 100644<br>
--- a/recipes-containers/lxc/lxc_git.bb<br>
+++ b/recipes-containers/lxc/lxc_git.bb<br>
@@ -141,7 +141,7 @@ do_install:append() {<br>
&nbsp;<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; if &quot;${@bb.utils.conta=
ins('DISTRO_FEATURES', 'systemd', 'true', 'false', d)}&quot;; then<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
nothing special for systemd at the moment<br>
-&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; true<br>
+&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; (cd ${D}${loc=
alstatedir}; [ -d lib/lxc ] &amp;&amp; rmdir -v --parents lib/lxc)<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; else<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
with meson, these aren't built unless sysvinit is the enabled<br>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; # =
init system.<br>
--<br>
2.25.1<br>
<br>
</div>
</body>
</html>

--_000_PH0PR02MB879642E5EB65B35A4CE40540F1B4APH0PR02MB8796namp_--

