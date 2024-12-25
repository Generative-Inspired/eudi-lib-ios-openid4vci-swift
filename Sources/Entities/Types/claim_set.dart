
enum ClaimSet {
  w3CJsonLdDataIntegrity(W3CJsonLdDataIntegrityClaimSet claimSet),
  w3CJsonLdSignedJwt(W3CJsonLdSignedJwtClaimSet claimSet),
  w3CSignedJwt(W3CSignedJwtClaimSet claimSet),
  msoMdoc(MsoMdocClaimSet? claimSet),
  sdJwtVc(SdJwtVcClaimSet? claimSet),
  generic(GenericClaimSet? claimSet);

  Map<String, dynamic>? toDictionary() {
    switch (this) {
      case w3CJsonLdDataIntegrity:
      case w3CJsonLdSignedJwt:
      case w3CSignedJwt:
        return null;
      case msoMdoc(final claimSet):
        if (claimSet?.claims == null) return null;
        final grouped = groupBy(
          claimSet!.claims!,
          (key, value) => key,
        );
        try {
          return Map.fromEntries(grouped.entries.map((entry) {
            final json = {};
            entry.value.forEach((tuple) {
              json[tuple.$2] = {};
            });
            return MapEntry(entry.key, json);
          }));
        } catch (e) {
          return {};
        }
      case sdJwtVc:
        return null;
      case generic(final claimSet):
        if (claimSet?.claims == null) return null;
        return Map.fromEntries(
          claimSet!.claims!.map((claim) => MapEntry(claim, {})),
        );
    }
  }

  ClaimSet? validate(List<String> claims) {
    switch (this) {
      case w3CJsonLdDataIntegrity:
      case w3CJsonLdSignedJwt:
      case w3CSignedJwt:
        return null;
      case msoMdoc(final claimSet):
        if (claimSet?.claims == null) return null;
        if (claims.isNotEmpty) {
          for (final claim in claimSet!.claims!) {
            if (!claims.contains(claim.$2)) {
              throw ValidationError(
                reason: "Requested claim name ${claim.$2} is not supported by issuer",
              );
            }
          }
          return this;
        }
        return null;
      case sdJwtVc(final claimSet):
        if (claimSet?.claims == null) return null;
        if (claims.isNotEmpty) {
          for (final claim in claimSet!.claims!.entries) {
            if (!claims.contains(claim.key)) {
              throw ValidationError(
                reason: "Requested claim name ${claim.key} is not supported by issuer",
              );
            }
          }
          return this;
        }
        return null;
      case generic(final claimSet):
        if (claimSet?.claims == null) return null;
        if (claims.isNotEmpty) {
          for (final claimName in claimSet!.claims!) {
            if (!claims.contains(claimName)) {
              throw ValidationError(
                reason: "Requested claim name $claimName is not supported by issuer",
              );
            }
          }
          return this;
        }
        return null;
    }
  }
}
