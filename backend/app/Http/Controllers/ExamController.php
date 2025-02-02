<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Models\Exam;

class ExamController extends Controller
{
    public function index()
    {
        $exams = Exam::all();
        return response()->json($exams);
    }

    public function store(Request $request)
    {
        $exam = Exam::create($request->all());
        return response()->json($exam, 201);
    }

    public function show($id)
    {
        $exam = Exam::find($id);
        return response()->json($exam);
    }

    public function update(Request $request, $id)
    {
        $exam = Exam::find($id);
        $exam->update($request->all());
        return response()->json($exam);
    }

    public function destroy($id)
    {
        Exam::destroy($id);
        return response()->json(null, 204);
    }
}
