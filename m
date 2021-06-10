Received: from mail1.wrs.com (mail1.wrs.com [147.11.146.13])
 by mx.groups.io with SMTP id smtpd.web09.10792.1623335195565031741
 for <meta-virtualization@lists.yoctoproject.org>;
 Thu, 10 Jun 2021 07:26:35 -0700
Authentication-Results: mx.groups.io;
 dkim=missing; spf=pass (domain: windriver.com, ip: 147.11.146.13, mailfrom: sakib.sajal@windriver.com)
Received: from mail.windriver.com (mail.wrs.com [147.11.1.11])
	by mail1.wrs.com (8.15.2/8.15.2) with ESMTPS id 15AEQY2c028876
	(version=TLSv1.1 cipher=DHE-RSA-AES256-SHA bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Jun 2021 07:26:34 -0700
Received: from ala-exchng01.corp.ad.wrs.com (ala-exchng01.corp.ad.wrs.com [147.11.82.252])
	by mail.windriver.com (8.15.2/8.15.2) with ESMTPS id 15AEQYs1010583
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-virtualization@lists.yoctoproject.org>; Thu, 10 Jun 2021 07:26:34 -0700 (PDT)
Received: from ala-exchng01.corp.ad.wrs.com (147.11.82.252) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2242.10; Thu, 10 Jun 2021 07:26:34 -0700
Received: from yow-lpggp3.wrs.com (128.224.137.13) by
 ala-exchng01.corp.ad.wrs.com (147.11.82.252) with Microsoft SMTP Server id
 15.1.2242.10 via Frontend Transport; Thu, 10 Jun 2021 07:26:33 -0700
From: sakib.sajal@windriver.com
To: <meta-virtualization@lists.yoctoproject.org>
Subject: [meta-virtualization][hardnott][PATCH 1/2] kubernetes: fix CVE-2021-25737
Date: Thu, 10 Jun 2021 10:26:32 -0400
Message-ID: <20210610142633.28061-1-sakib.sajal@windriver.com>
X-Mailer: git-send-email 2.29.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain

Updating EndpointSlice validation to match Endpoints validation

Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
---
 .../kubernetes/CVE-2021-25737.patch           | 213 ++++++++++++++++++
 .../kubernetes/kubernetes_git.bb              |   1 +
 2 files changed, 214 insertions(+)
 create mode 100644 recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch

diff --git a/recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch b/recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch
new file mode 100644
index 0000000..43358d5
--- /dev/null
+++ b/recipes-containers/kubernetes/kubernetes/CVE-2021-25737.patch
@@ -0,0 +1,213 @@
+From dd95bba6cd1dfec0985d3e1068c12713597cbe4a Mon Sep 17 00:00:00 2001
+From: Rob Scott <robertjscott@google.com>
+Date: Fri, 9 Apr 2021 15:24:17 -0700
+Subject: [PATCH] Updating EndpointSlice validation to match Endpoints
+ validation
+
+Upstream-Status: Backport [dd95bba6cd1dfec0985d3e1068c12713597cbe4a]
+CVE: CVE-2021-25737
+
+Signed-off-by: Sakib Sajal <sakib.sajal@windriver.com>
+
+---
+ pkg/apis/core/validation/validation.go        | 18 ++++---
+ pkg/apis/core/validation/validation_test.go   | 40 +++++++++++++++
+ pkg/apis/discovery/validation/validation.go   |  2 +
+ .../discovery/validation/validation_test.go   | 51 +++++++++++++++++--
+ 4 files changed, 101 insertions(+), 10 deletions(-)
+
+diff --git a/src/import/pkg/apis/core/validation/validation.go b/src/import/pkg/apis/core/validation/validation.go
+index fd3477176a4..197be6388c7 100644
+--- a/src/import/pkg/apis/core/validation/validation.go
++++ b/src/import/pkg/apis/core/validation/validation.go
+@@ -4239,7 +4239,7 @@ func ValidateService(service *core.Service) field.ErrorList {
+ 				allErrs = append(allErrs, field.Invalid(idxPath, ip, msgs[i]))
+ 			}
+ 		} else {
+-			allErrs = append(allErrs, validateNonSpecialIP(ip, idxPath)...)
++			allErrs = append(allErrs, ValidateNonSpecialIP(ip, idxPath)...)
+ 		}
+ 	}
+ 
+@@ -5703,15 +5703,19 @@ func validateEndpointAddress(address *core.EndpointAddress, fldPath *field.Path)
+ 			allErrs = append(allErrs, field.Invalid(fldPath.Child("nodeName"), *address.NodeName, msg))
+ 		}
+ 	}
+-	allErrs = append(allErrs, validateNonSpecialIP(address.IP, fldPath.Child("ip"))...)
++	allErrs = append(allErrs, ValidateNonSpecialIP(address.IP, fldPath.Child("ip"))...)
+ 	return allErrs
+ }
+ 
+-func validateNonSpecialIP(ipAddress string, fldPath *field.Path) field.ErrorList {
+-	// We disallow some IPs as endpoints or external-ips.  Specifically,
+-	// unspecified and loopback addresses are nonsensical and link-local
+-	// addresses tend to be used for node-centric purposes (e.g. metadata
+-	// service).
++// ValidateNonSpecialIP is used to validate Endpoints, EndpointSlices, and
++// external IPs. Specifically, this disallows unspecified and loopback addresses
++// are nonsensical and link-local addresses tend to be used for node-centric
++// purposes (e.g. metadata service).
++//
++// IPv6 references
++// - https://www.iana.org/assignments/iana-ipv6-special-registry/iana-ipv6-special-registry.xhtml
++// - https://www.iana.org/assignments/ipv6-multicast-addresses/ipv6-multicast-addresses.xhtml
++func ValidateNonSpecialIP(ipAddress string, fldPath *field.Path) field.ErrorList {
+ 	allErrs := field.ErrorList{}
+ 	ip := net.ParseIP(ipAddress)
+ 	if ip == nil {
+diff --git a/src/import/pkg/apis/core/validation/validation_test.go b/src/import/pkg/apis/core/validation/validation_test.go
+index bfdb5237241..f379cd47368 100644
+--- a/src/import/pkg/apis/core/validation/validation_test.go
++++ b/src/import/pkg/apis/core/validation/validation_test.go
+@@ -16915,3 +16915,43 @@ func TestValidatePodTemplateSpecSeccomp(t *testing.T) {
+ 		asserttestify.Equal(t, test.expectedErr, err, "TestCase[%d]: %s", i, test.description)
+ 	}
+ }
++
++func TestValidateNonSpecialIP(t *testing.T) {
++	fp := field.NewPath("ip")
++
++	// Valid values.
++	for _, tc := range []struct {
++		desc string
++		ip   string
++	}{
++		{"ipv4", "10.1.2.3"},
++		{"ipv6", "2000::1"},
++	} {
++		t.Run(tc.desc, func(t *testing.T) {
++			errs := ValidateNonSpecialIP(tc.ip, fp)
++			if len(errs) != 0 {
++				t.Errorf("ValidateNonSpecialIP(%q, ...) = %v; want nil", tc.ip, errs)
++			}
++		})
++	}
++	// Invalid cases
++	for _, tc := range []struct {
++		desc string
++		ip   string
++	}{
++		{"ipv4 unspecified", "0.0.0.0"},
++		{"ipv6 unspecified", "::0"},
++		{"ipv4 localhost", "127.0.0.0"},
++		{"ipv4 localhost", "127.255.255.255"},
++		{"ipv6 localhost", "::1"},
++		{"ipv6 link local", "fe80::"},
++		{"ipv6 local multicast", "ff02::"},
++	} {
++		t.Run(tc.desc, func(t *testing.T) {
++			errs := ValidateNonSpecialIP(tc.ip, fp)
++			if len(errs) == 0 {
++				t.Errorf("ValidateNonSpecialIP(%q, ...) = nil; want non-nil (errors)", tc.ip)
++			}
++		})
++	}
++}
+diff --git a/src/import/pkg/apis/discovery/validation/validation.go b/src/import/pkg/apis/discovery/validation/validation.go
+index 8499e7a696a..d1fa4c8ce0f 100644
+--- a/src/import/pkg/apis/discovery/validation/validation.go
++++ b/src/import/pkg/apis/discovery/validation/validation.go
+@@ -96,8 +96,10 @@ func validateEndpoints(endpoints []discovery.Endpoint, addrType discovery.Addres
+ 			switch addrType {
+ 			case discovery.AddressTypeIPv4:
+ 				allErrs = append(allErrs, validation.IsValidIPv4Address(addressPath.Index(i), address)...)
++				allErrs = append(allErrs, apivalidation.ValidateNonSpecialIP(address, addressPath.Index(i))...)
+ 			case discovery.AddressTypeIPv6:
+ 				allErrs = append(allErrs, validation.IsValidIPv6Address(addressPath.Index(i), address)...)
++				allErrs = append(allErrs, apivalidation.ValidateNonSpecialIP(address, addressPath.Index(i))...)
+ 			case discovery.AddressTypeFQDN:
+ 				allErrs = append(allErrs, validation.IsFullyQualifiedDomainName(addressPath.Index(i), address)...)
+ 			}
+diff --git a/src/import/pkg/apis/discovery/validation/validation_test.go b/src/import/pkg/apis/discovery/validation/validation_test.go
+index 5c7d478eb7e..0d944b59d12 100644
+--- a/src/import/pkg/apis/discovery/validation/validation_test.go
++++ b/src/import/pkg/apis/discovery/validation/validation_test.go
+@@ -52,6 +52,21 @@ func TestValidateEndpointSlice(t *testing.T) {
+ 				}},
+ 			},
+ 		},
++		"good-ipv6": {
++			expectedErrors: 0,
++			endpointSlice: &discovery.EndpointSlice{
++				ObjectMeta:  standardMeta,
++				AddressType: discovery.AddressTypeIPv6,
++				Ports: []discovery.EndpointPort{{
++					Name:     utilpointer.StringPtr("http"),
++					Protocol: protocolPtr(api.ProtocolTCP),
++				}},
++				Endpoints: []discovery.Endpoint{{
++					Addresses: []string{"a00:100::4"},
++					Hostname:  utilpointer.StringPtr("valid-123"),
++				}},
++			},
++		},
+ 		"good-fqdns": {
+ 			expectedErrors: 0,
+ 			endpointSlice: &discovery.EndpointSlice{
+@@ -375,7 +390,7 @@ func TestValidateEndpointSlice(t *testing.T) {
+ 			},
+ 		},
+ 		"bad-ip": {
+-			expectedErrors: 1,
++			expectedErrors: 2,
+ 			endpointSlice: &discovery.EndpointSlice{
+ 				ObjectMeta:  standardMeta,
+ 				AddressType: discovery.AddressTypeIPv4,
+@@ -390,7 +405,7 @@ func TestValidateEndpointSlice(t *testing.T) {
+ 			},
+ 		},
+ 		"bad-ipv4": {
+-			expectedErrors: 2,
++			expectedErrors: 3,
+ 			endpointSlice: &discovery.EndpointSlice{
+ 				ObjectMeta:  standardMeta,
+ 				AddressType: discovery.AddressTypeIPv4,
+@@ -405,7 +420,7 @@ func TestValidateEndpointSlice(t *testing.T) {
+ 			},
+ 		},
+ 		"bad-ipv6": {
+-			expectedErrors: 2,
++			expectedErrors: 4,
+ 			endpointSlice: &discovery.EndpointSlice{
+ 				ObjectMeta:  standardMeta,
+ 				AddressType: discovery.AddressTypeIPv6,
+@@ -454,6 +469,36 @@ func TestValidateEndpointSlice(t *testing.T) {
+ 			expectedErrors: 3,
+ 			endpointSlice:  &discovery.EndpointSlice{},
+ 		},
++		"special-ipv4": {
++			expectedErrors: 1,
++			endpointSlice: &discovery.EndpointSlice{
++				ObjectMeta:  standardMeta,
++				AddressType: discovery.AddressTypeIPv4,
++				Ports: []discovery.EndpointPort{{
++					Name:     utilpointer.StringPtr("http"),
++					Protocol: protocolPtr(api.ProtocolTCP),
++				}},
++				Endpoints: []discovery.Endpoint{{
++					Addresses: []string{"127.0.0.1"},
++					Hostname:  utilpointer.StringPtr("valid-123"),
++				}},
++			},
++		},
++		"special-ipv6": {
++			expectedErrors: 1,
++			endpointSlice: &discovery.EndpointSlice{
++				ObjectMeta:  standardMeta,
++				AddressType: discovery.AddressTypeIPv6,
++				Ports: []discovery.EndpointPort{{
++					Name:     utilpointer.StringPtr("http"),
++					Protocol: protocolPtr(api.ProtocolTCP),
++				}},
++				Endpoints: []discovery.Endpoint{{
++					Addresses: []string{"fe80::9656:d028:8652:66b6"},
++					Hostname:  utilpointer.StringPtr("valid-123"),
++				}},
++			},
++		},
+ 	}
+ 
+ 	for name, testCase := range testCases {
+-- 
+2.25.1
+
diff --git a/recipes-containers/kubernetes/kubernetes_git.bb b/recipes-containers/kubernetes/kubernetes_git.bb
index bc694a2..57cadfe 100644
--- a/recipes-containers/kubernetes/kubernetes_git.bb
+++ b/recipes-containers/kubernetes/kubernetes_git.bb
@@ -16,6 +16,7 @@ SRC_URI = "git://github.com/kubernetes/kubernetes.git;branch=release-1.20;name=k
            file://0001-generate-bindata-unset-GOBIN.patch \
            file://0001-build-golang.sh-convert-remaining-go-calls-to-use.patch \
            file://0001-Makefile.generated_files-Fix-race-issue-for-installi.patch \
+           file://CVE-2021-25737.patch \
           "
 
 DEPENDS += "rsync-native \
-- 
2.29.2

