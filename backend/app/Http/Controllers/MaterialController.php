<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Material;

class MaterialController extends Controller
{
    public function index()
    {
        $materials = Material::all();
        return response()->json($materials);
    }

    public function store(Request $request)
    {
        $material = Material::create($request->all());
        return response()->json($material, 201);
    }

    public function show($id)
    {
        $material = Material::find($id);
        return response()->json($material);
    }

    public function update(Request $request, $id)
    {
        $material = Material::find($id);
        $material->update($request->all());
        return response()->json($material);
    }

    public function destroy($id)
    {
        Material::destroy($id);
        return response()->json(null, 204);
    }
}
